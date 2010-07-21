/**
 * 
 */
package com.ug.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.ug.dao.UGUserDAO;
import com.ug.model.ResultInfo;
import com.ug.model.UG_User;
import com.ug.service.UserManager;

/**
 * @author srajen03
 *
 */
public class UserManagerImpl implements UserManager {

	private Logger logger = Logger.getLogger(UserManagerImpl.class);
	
	@Autowired
	private UGUserDAO ugUserDAO;
	private JavaMailSender mailSender;
    private VelocityEngine velocityEngine;
	
	@Override
	public ResultInfo addUser(UG_User user) throws Exception {
		logger.info("addUser() started...");
		ResultInfo result = null;
		UG_User newUser = ugUserDAO.addUser(user);
		if(newUser != null){
			logger.info("User added successfully! userId ==>" + newUser.getId());
			sendConfirmationMail(user);
			result = createResultInfo(true, "UG_User Added successfully!", "0", "UG_User Added successfully!", newUser);
		}else{
			result = createResultInfo(false, "UG_User not added.", "1", "UG_User not added. Check the logs for more detail", newUser);
		}
		return result;
	}

	@Override
	public boolean validateUser(String userName, String password) throws Exception {
		logger.info("inside validateUser()");
		return ugUserDAO.validateUser(userName, password);
	}
	
	private void sendConfirmationMail(final UG_User user){
		logger.info("inside sendConfirmationMail()");
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
               MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
               message.setTo(user.getEmailId());
               message.setSubject("UnivGiggle User Confirmation");
               Map model = new HashMap();
               model.put("user", user);
               String text = VelocityEngineUtils.mergeTemplateIntoString(
                  velocityEngine, "UGUserConfirmation.vm", model);
               logger.info("Mail content :: \n" + text);
               message.setText(text, true);
            }
         };
         this.mailSender.send(preparator);
	}
	/**
	 * Create ResultInfo Object
	 * @param status
	 * @param resDetail
	 * @param resCode
	 * @param resString
	 * @param obj
	 * @return
	 */
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
	public ResultInfo updateConfirmationStatus(String emailId) throws Exception {
		logger.info("updateConfirmationStatus() started..");
		ResultInfo resultInfo = null;
		boolean isUpdated = ugUserDAO.updateUser(emailId);
		if(isUpdated){
			resultInfo = createResultInfo(true, "UGUser updated successfully!", "0", "UGUser updated successfully!", null);
		}else{
			resultInfo = createResultInfo(false, "UGUser update failed!", "1", "UGUser update failed!", null);
		}
		return resultInfo;
		
	}
	/**
	 * Get the User details
	 */
	@Override
	public UG_User getUser(String emailId) throws Exception {
		logger.info("inside getUser()...");
		logger.info("emailId ==> "+ emailId);
		UG_User user = null;
		user = ugUserDAO.getUser(emailId);
		return user;
	}
	
	
	@Override
	public boolean sendPasswordToUser(String emailId) throws Exception {
		logger.info("sendPasswordToUser() started...");
		final UG_User user = getUser(emailId);
		if(user != null){
			logger.info("User is availble... sending password to his/her email...");
			MimeMessagePreparator preparator = new MimeMessagePreparator() {
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
					message.setTo(user.getEmailId());
					message.setSubject("UnivGiggle user account details.");
					Map model = new HashMap();
					model.put("user", user);
					String text = VelocityEngineUtils.mergeTemplateIntoString(
							velocityEngine, "ForgotPassword.vm", model);
					logger.info("Mail content :: \n" + text);
					message.setText(text, true);
				}
			};
			this.mailSender.send(preparator);
			return true;
		}else{
			logger.error("User not exists.");
			return false;
		}
	}

	
	
	/**
	 * @param ugUserDAO the ugUserDAO to set
	 */
	public void setUgUserDAO(UGUserDAO ugUserDAO) {
		this.ugUserDAO = ugUserDAO;
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

	

}
