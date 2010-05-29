/**
 * 
 */
package com.ug.service.impl;

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
import com.ug.service.ClassifiedManager;

/**
 * @author srajen03
 *
 */
public class ClassifiedManagerImpl implements ClassifiedManager {

	Logger logger = Logger.getLogger(ClassifiedManagerImpl.class);
	
	@Autowired
	private ClassifiedDAO classifiedDAO;
	private JavaMailSender mailSender;
    private VelocityEngine velocityEngine;
    
    
	
	@Override
	public ResultInfo addClassified(Classified classified) throws Exception {
		logger.info("addClassified() started..");
		Classified cfd = classifiedDAO.addClassified(classified);
		ResultInfo resultInfo = null;
		if(cfd != null){
			logger.info("Classified added successfully!, sending mail to the user to acknowledge");
			sendConfirmationMail(cfd);
			resultInfo = createResultInfo(true, "Classified Added successfully!", "0", "Classified Added successfully!", cfd);
		}else{
			logger.info("Classified adding failed..");
			resultInfo = createResultInfo(false, "Classified Added failed", "1", "Classified Added failed!", null);
		}
		return resultInfo;
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



	@Override
	public List<Classified> getListClassifieds(String country, String state,
			String university, String searchText) throws Exception {
		logger.info("getListClassifieds() started..");
		logger.info("country ==>"+ country + ", state ==>"+ state + ", university ==>"+ university);
		logger.info("searchText ==>"+ searchText);
		
		
		return classifiedDAO.getAllClassifieds(country,state,university,searchText);
	}


	

}
