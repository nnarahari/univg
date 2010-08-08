/**
 * 
 */
package com.ug.service.impl;

import java.util.ArrayList;
import java.util.Date;
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

import com.ug.dao.MenteeeDAO;
import com.ug.dao.MentorsRequestDAO;
import com.ug.model.Mentee;
import com.ug.model.MentorsRequest;
import com.ug.model.ResultInfo;
import com.ug.model.Testimonial;
import com.ug.service.MenteeManager;
import com.ug.util.UnivGiggleUtil;

/**
 * @author srini
 *
 */
public class MenteeManagerImpl implements MenteeManager {

	@Autowired
	private MenteeeDAO menteeDAO;
	private MentorsRequestDAO mentorsRequestDAO;
	private VelocityEngine velocityEngine;
	private JavaMailSender mailSender;
	
	private Logger logger = Logger.getLogger(MenteeManagerImpl.class);
	private String imageAppURL;
	private String imageWebURL;
	
	private final String MODULE_NAME = "mentee";
	
	/* (non-Javadoc)
	 * @see com.ug.service.MenteeManager#addMentee(com.ug.model.Mentee)
	 */
	@Override
	public ResultInfo addMentee(Mentee mentee,String imageFileName, byte[] imageData) throws Exception {
		logger.info("addMentee started()");
		ResultInfo resultInfo = null;
		boolean isMenteeAdded = false;
		Mentee newMentee = menteeDAO.addMentee(mentee);
		if(newMentee != null){
			logger.info("New mentee Id ==>" + newMentee.getId());
			if(imageData != null && imageFileName != null){
				logger.info("Image uploaded with mentee.. storing the image..");
				String imagePath = UnivGiggleUtil.storeImage(imageFileName, imageData, newMentee.getId(),MODULE_NAME,imageAppURL,imageWebURL );
				if(imagePath != null){
					logger.info("updating image in mentee's details..");
					newMentee.setImagePaths(imagePath);
					boolean isImagePathUpdated = menteeDAO.updateMentee(newMentee);
					if(isImagePathUpdated){
						logger.info("Mentee image path updated successfully!");
						isMenteeAdded = true;
					}else{
						logger.error("Mentee image path not updated in DB");
						resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentee added Failed!", "101", "Error while updating mentee image path", newMentee);
					}
				}else{
					resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentee added Failed!", "102", "Error while storing mentee image.", newMentee);
					logger.error("Error while storing the mentee image.");
				}
			}else{
				logger.info("No images to save..");
				isMenteeAdded = true;
			}
			
		}else{
			logger.error("Adding new Mentee failed..");
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentee added Failed!", "102", "Error while storing mentee details.", newMentee);
			isMenteeAdded = false;
		}
		if(isMenteeAdded){
			logger.info("Sending confirmation mail to mentee...");
			sendConfirmationMail(newMentee);
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentee added Successfully!", "0", "Mentee added Successfully!", newMentee);
		}
		return resultInfo;
	}

	

	/* (non-Javadoc)
	 * @see com.ug.service.MenteeManager#getMentee(java.lang.String)
	 */
	@Override
	public Mentee getMentee(String email) {
		logger.info("getMentee() started..email ==>"+ email);
		try{
			Mentee mentee = menteeDAO.getMentee(email);
			logger.info ("Mentee Details ==>" + mentee);
			return mentee;
		}catch (Exception e) {
			logger.error("Error while getMentee() ",e);
			return null;
		}
	}

	/* (non-Javadoc)
	 * @see com.ug.service.MenteeManager#removeMentee(com.ug.model.Mentee)
	 */
	@Override
	public ResultInfo deleteMentee(Mentee mentee) throws Exception {
		logger.info("deleteMentee() started..");
		boolean isRemoved = menteeDAO.deleteMentee(mentee);
		ResultInfo resultInfo = null;
		if(isRemoved)
			resultInfo  = UnivGiggleUtil.createResultInfo(true, "Mentee removed Successfully!", "0", "Mentee removed Successfully!", null);
		else
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Removing Mentee failed", "105", "Removing Mentee failed", null);
		return resultInfo;
	}

	/* (non-Javadoc)
	 * @see com.ug.service.MenteeManager#updateMentee(com.ug.model.Mentee)
	 */
	@Override
	public ResultInfo updateMentee(Mentee mentee) {
		logger.info("updateMentee() started..");
		boolean isMenteeUpdated = false;
		ResultInfo resultInfo = null;
		isMenteeUpdated = menteeDAO.updateMentee(mentee);
		logger.info("isMenteeUpdated ==>"+ isMenteeUpdated);
		if(isMenteeUpdated)
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentee updated successfully!", "0", "Mentee updated successfully!", null);
		else
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentee update failed!", "102", "Error while updating mentee details.", null);
		return resultInfo;
	}


	@Override
	public List<Mentee> getAvailableMentees() throws Exception {
		logger.info("inside getAvailableMentees()");
		List<Mentee> availableMentees = new ArrayList<Mentee>();
		try {
			availableMentees = menteeDAO.getAvailableMentees();
		} catch (Exception e) {
			logger.error("Error while retrieving all available mentees ", e);
			throw e;
		}
		return availableMentees;
	}
	
	
	@Override
	public ResultInfo addRequestToMentor(String mentorEmail, String menteeEmail, Date requestTime) throws Exception {
		logger.info("addRequestToMentor() started...");
		ResultInfo resultInfo = null;
		MentorsRequest mentorsRequest = new MentorsRequest(mentorEmail, menteeEmail, requestTime);
		boolean isMentorRequestAdded = mentorsRequestDAO.addMentorsRequest(mentorsRequest);
		if(isMentorRequestAdded)
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentee's request to mentor added successfully", "0", "Success", null);
		else
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Mentee's request to mentor not added successfully", "108", "Fail", null);
		return resultInfo;
	}
	

	private void sendConfirmationMail(final Mentee mentee){
		logger.info("inside sendConfirmationMail()");
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
               MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
               message.setTo(mentee.getEmail());
               message.setSubject("UnivGiggle Mentee Confirmation");
               Map model = new HashMap();
               model.put("mentee", mentee);
               String text = VelocityEngineUtils.mergeTemplateIntoString(
                  velocityEngine, "MenteeConfirmation.vm", model);
               logger.info("Mail content :: \n" + text);
               message.setText(text, true);
            }
         };
         this.mailSender.send(preparator);
	}
	
	
	/**
	 * @return the menteeDAO
	 */
	public MenteeeDAO getMenteeDAO() {
		return menteeDAO;
	}

	/**
	 * @param menteeDAO the menteeDAO to set
	 */
	public void setMenteeDAO(MenteeeDAO menteeDAO) {
		this.menteeDAO = menteeDAO;
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
	 * @return the velocityEngine
	 */
	public VelocityEngine getVelocityEngine() {
		return velocityEngine;
	}



	/**
	 * @param velocityEngine the velocityEngine to set
	 */
	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}



	/**
	 * @param mailSender the mailSender to set
	 */
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}



	@Override
	public boolean activateMentee(String menteeId) throws Exception {
		logger.info("inside activateMentee()...");
		return menteeDAO.activateMentee(menteeId);
	}



	@Override
	public ResultInfo addTestimonial(String menteeEmail, Testimonial testimonial) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<Testimonial> getAllTestimonial(String menteeEmail) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public ResultInfo removeTestimonial(String menteeEmail,	Testimonial testimonial) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	/**
	 * @param mentorsRequestDAO the mentorsRequestDAO to set
	 */
	public void setMentorsRequestDAO(MentorsRequestDAO mentorsRequestDAO) {
		this.mentorsRequestDAO = mentorsRequestDAO;
	}

}
