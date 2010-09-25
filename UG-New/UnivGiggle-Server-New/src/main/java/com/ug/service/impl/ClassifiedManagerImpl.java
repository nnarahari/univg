/**
 * 
 */
package com.ug.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.ug.dao.ClassifiedDAO;
import com.ug.model.Classified;
import com.ug.model.ResultInfo;
import com.ug.model.UG_User;
import com.ug.service.ClassifiedManager;
import com.ug.service.UserManager;

/**
 * @author srrajend
 *
 */
public class ClassifiedManagerImpl implements ClassifiedManager {

	Logger logger = Logger.getLogger(ClassifiedManagerImpl.class);
	
	private String imageAppURL;
	private String imageWebURL;
	
	@Autowired
	private ClassifiedDAO classifiedDAO;
	private JavaMailSender mailSender;
    private VelocityEngine velocityEngine;
    
    private UserManager userManager;
    
    
	/**
	 * 
	 */
	@Override
	public ResultInfo addClassified(Classified classified, List<String> fileNameList, List<byte []> imageDataList) throws Exception {
		logger.info("addClassified() started..");
		Classified cfd = classifiedDAO.addClassified(classified);
		ResultInfo resultInfo = null;
		boolean cfdAddedStatus = false;
		if(cfd != null){
			if(fileNameList != null && imageDataList != null){
				logger.info("This classified contains images also.. saving that images..");
				String imagePaths = storeClassifiedImages(fileNameList, imageDataList, cfd.getId());
				if(imagePaths != null){
					logger.info("images are stored successfully & got the imagePaths, updating the classified..");
					boolean isImagePahtUpdated = classifiedDAO.updateClassifiedImagePath(imagePaths, cfd.getId().toString());
					logger.info("isImagePahtUpdated ==>"+ isImagePahtUpdated);
					if(isImagePahtUpdated){
						cfdAddedStatus = true;
					}else{
						resultInfo = createResultInfo(false, "Classified Added failed", "2", "Error while updating image path in DB", null);
					}
				}else{
					resultInfo = createResultInfo(false, "Classified Added failed", "2", "Error while storing images", null);
				}
			}else{
				logger.info("No images with this classified.");
				cfdAddedStatus = true;
			}
			if(cfdAddedStatus){
				logger.info("Classified added successfully!, sending mail to the user to acknowledge");
				sendConfirmationMail(cfd);
				resultInfo = createResultInfo(true, "Classified Added successfully!", "0", "Classified Added successfully!", cfd);
			}
			
		}else{
			logger.info("Classified adding failed..");
			resultInfo = createResultInfo(false, "Classified Added failed", "1", "Classified Added failed!", null);
		}
		return resultInfo;
	}	
	/**
	 * 
	 * @param fileNameList
	 * @param imageData
	 * @param classifiedId
	 * @return
	 */
	private String storeClassifiedImages(List<String> fileNameList, List<byte []> imageData, Long classifiedId){
		logger.info("inside storeClassifiedImages()");
		String imagePaths="";
		logger.info("imageAppURL ==>" + imageAppURL);
		String cfdImageFolder = imageAppURL + File.separator + "classified"+ File.separator +classifiedId.toString() + File.separator;
		logger.info("cfdImageFolder ==>"+ cfdImageFolder);
		boolean foldersCreated = new File(cfdImageFolder).mkdirs();
		logger.info("foldersCreated ==>"+ foldersCreated);
		String imageName ="";
		String imageNameURL = "";
		FileOutputStream fos=null;
		byte[] byteImageDate = null;
		for(int i=0; i<fileNameList.size();i++){
			imageName = fileNameList.get(i).trim();
			imageNameURL = cfdImageFolder + imageName;
			logger.info("saving this file ==>"+ imageName);
			byteImageDate = imageData.get(i);
			try {
				fos = new FileOutputStream(new File(imageNameURL));
				fos.write(byteImageDate);
				fos.close();
			} catch (FileNotFoundException e) {
				logger.error("Error while saving images ", e);
			} catch (IOException e) {
				logger.error("Error while saving images ", e);
			}
			fos = null;
			imagePaths += imageWebURL + "/classified/"+ classifiedId.toString() + "/"+ imageName +"|";
		}
		logger.info("imagePaths ==>"+ imagePaths);
		return imagePaths;
		
	}
	
	
	@Override
	public ResultInfo updateConfirmationStatus(String classifiedId) throws Exception {
		logger.info("updateConfirmationStatus() started..");
		ResultInfo resultInfo = null;
		boolean isUpdated = classifiedDAO.updateClassified(classifiedId);
		if(isUpdated){
			resultInfo = createResultInfo(true, "Classified updated successfully!", "0", "Classified updated successfully!", null);
		}else{
			resultInfo = createResultInfo(false, "Classified update failed!", "1", "Classified update failed!", null);
		}
		return resultInfo;
	}
	
	
	
	private void sendConfirmationMail(final Classified classified){
		logger.info("inside sendConfirmationMail()");
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
               MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
               message.setTo(classified.getEmail());
               message.setSubject("UnivGiggle Classified Confirmation");
               
               Map model = new HashMap();
               model.put("classified", classified);
               String text = VelocityEngineUtils.mergeTemplateIntoString(
                  velocityEngine, "ClassifiedConfirmation.vm", model);
               logger.info("Mail content :: \n" + text);
               message.setText(text, true);
            }
         };
         this.mailSender.send(preparator);
	}
	
	
	private ResultInfo createResultInfo(boolean status, String resDetail, String resCode, String resString, Object obj ){
		ResultInfo resultInfo = new ResultInfo();
		resultInfo.setSuccess(status);
		resultInfo.setResponseDetail(resDetail);
		resultInfo.setResponseCode(resCode);
		resultInfo.setResponseString(resString);
		resultInfo.setResponseObject(obj);
		return resultInfo;
		
	}
	
	@Override
	public List<Classified> getListClassifieds(String country, String state,
			String university, String searchText) throws Exception {
		logger.info("getListClassifieds() started..");
		logger.info("country ==>"+ country + ", state ==>"+ state + ", university ==>"+ university);
		logger.info("searchText ==>"+ searchText);
		return classifiedDAO.getAllClassifieds(country,state,university,searchText);
	}
	
	
	@Override
	public boolean forwardClassified(String userEmail, String classifiedId,	final String toEmail) {
		logger.info("forwardClassified() started...");
		logger.info("userEmail ==>"+ userEmail + " , classifiedId ==>"+ classifiedId + " ,toEmail ==>"+toEmail);
		
		Classified classified1 = null;
		try {
			classified1 = classifiedDAO.getClassified(classifiedId);
		} catch (Exception e) {
			logger.error("Error while reteriving classified...",e);
		}
		final Classified classified = classified1;
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
               MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
               message.setTo(toEmail);
               message.setSubject("UnivGiggle Classified forward");
               Map model = new HashMap();
               model.put("classified", classified);
               String text = VelocityEngineUtils.mergeTemplateIntoString(
                  velocityEngine, "ClassifiedForward.vm", model);
               logger.info("Mail content :: \n" + text);
               message.setText(text, true);
            }
         };
         this.mailSender.send(preparator);
		
		return true;
	}
	@Override
	public boolean replyToClassified(final String userEmail, String classifiedId,	final String replyMessage) {
		logger.info("replyToClassified() started...");
		logger.info("userEmail ==>"+ userEmail + " , classifiedId ==>"+ classifiedId + " ,replyMessage ==>"+replyMessage);
		Classified classified1 = null;
		UG_User user = null;
		
		try {
			classified1 = classifiedDAO.getClassified(classifiedId);
		} catch (Exception e) {
			logger.error("Error while reteriving classified...",e);
			return false;
		}
		try {
			user = userManager.getUser(userEmail);
		} catch (Exception e) {
			logger.error("Error while getting user details...",e);
			return false;
		}
		
		final Classified classified = classified1;
		final String senderFirstName = user.getFirstName();
		final String senderLastName = user.getLastName();
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
               MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
               message.setTo(userEmail);
               message.setSubject("UnivGiggle Classified Reply");
               Map model = new HashMap();
               model.put("classified", classified);
               model.put("message", replyMessage);
               model.put("senderFirstName", senderFirstName);
               model.put("senderLastName", senderLastName);
               
               String text = VelocityEngineUtils.mergeTemplateIntoString(
                  velocityEngine, "ReplyClassified.vm", model);
               logger.info("Mail content :: \n" + text);
               message.setText(text, true);
            }
         };
         this.mailSender.send(preparator);
		
		return true;
	}
	
	/**
	 * @param classifiedDAO the classifiedDAO to set
	 */
	public void setClassifiedDAO(ClassifiedDAO classifiedDAO) {
		this.classifiedDAO = classifiedDAO;
	}
	/**
	 * @param mailSender the mailSender to set
	 */
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	/**
	 * @param velocityEngine the velocityEngine to set
	 */
	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}


	/**
	 * @return the imageAppURL
	 */
	public String getImageAppURL() {
		return imageAppURL;
	}

	/**
	 * @param imageAppURL the imageAppURL to set
	 */
	public void setImageAppURL(String imageAppURL) {
		this.imageAppURL = imageAppURL;
	}

	/**
	 * @return the imageWebURL
	 */
	public String getImageWebURL() {
		return imageWebURL;
	}

	/**
	 * @param imageWebURL the imageWebURL to set
	 */
	public void setImageWebURL(String imageWebURL) {
		this.imageWebURL = imageWebURL;
	}
	/**
	 * @param userManager the userManager to set
	 */
	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}
	
	

}
