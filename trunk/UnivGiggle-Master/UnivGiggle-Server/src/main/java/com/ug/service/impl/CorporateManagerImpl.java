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

import com.ug.dao.CorporateDAO;
import com.ug.model.Corporate;
import com.ug.model.ResultInfo;
import com.ug.service.CorporateManager;
import com.ug.util.UnivGiggleUtil;

/**
 * @author srrajend
 *
 */
public class CorporateManagerImpl implements CorporateManager {
	
	private Logger logger = Logger.getLogger(CorporateManagerImpl.class);
	
	@Autowired
	private CorporateDAO corporateDAO;
	private VelocityEngine velocityEngine;
	private JavaMailSender mailSender;
	
	private String imageAppURL;
	private String imageWebURL;

	/* (non-Javadoc)
	 * @see com.ug.service.CorporateManager#addCorporate(com.ug.model.Corporate)
	 */
	@Override
	public ResultInfo addCorporate(Corporate corporate) throws Exception {
		logger.info("addCorporate() started...");
		ResultInfo resultInfo = null;
		Corporate newCorporate = corporateDAO.createOrUpdateCorporate(corporate);
		logger.info(" corp name ==>"+ newCorporate.getCorporateName());
		
		if(newCorporate != null){
			logger.info("Corporate details added successfully");
			sendConfirmationMail(newCorporate);
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Corporate profile created successfully.", "0", "Corporate profile created successfully.", newCorporate);
		}else{
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Store Corporate profile failed.", "101", "Store Corporate profile failed.", null);
		}
		return resultInfo;
	}

	/* (non-Javadoc)
	 * @see com.ug.service.CorporateManager#getCorporate(java.lang.String)
	 */
	@Override
	public Corporate getCorporate(String corpEmail) throws Exception {
		logger.debug("getCorporate() started...corpEmail ==>"+ corpEmail);
		Corporate corporate = null;
		try{
			corporate = corporateDAO.getCorporate(corpEmail);
		}catch (Exception ex){
			logger.error("Error while querying corporate...",ex);
		}
		return corporate;
	}

	/* (non-Javadoc)
	 * @see com.ug.service.CorporateManager#updateCorporate(com.ug.model.Corporate)
	 */
	@Override
	public ResultInfo updateCorporate(Corporate corporate) throws Exception {
		logger.debug("updateCorporate() started...");
		ResultInfo resultInfo = null;
		Corporate corp = corporateDAO.createOrUpdateCorporate(corporate);
		if(corp != null)
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Corporate updated successfully!", "0", "Corporate updated successfully!", corp);
		else
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Corporate update failed!", "102", "Error while updating Corporate details.", null);
		return resultInfo;
	}
	
	
	@Override
	public boolean activateCorporate(String id) throws Exception {
		logger.debug("activateCorporate() started... id ==>"+ id);
		return corporateDAO.activateCorporate(id);
	}

	private void sendConfirmationMail(final Corporate corporate){
		logger.info("inside sendConfirmationMail()");
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
               MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
               message.setTo(corporate.getEmail());
               message.setSubject("UnivGiggle Corporate Confirmation");
               Map model = new HashMap();
               model.put("corporate", corporate);
               String text = VelocityEngineUtils.mergeTemplateIntoString(
                  velocityEngine, "CorporateConfirmation.vm", model);
               logger.info("Mail content :: \n" + text);
               message.setText(text, true);
            }
         };
         this.mailSender.send(preparator);
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
	 * @return the mailSender
	 */
	public JavaMailSender getMailSender() {
		return mailSender;
	}

	/**
	 * @param mailSender the mailSender to set
	 */
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
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
	 * @return the corporateDAO
	 */
	public CorporateDAO getCorporateDAO() {
		return corporateDAO;
	}

	/**
	 * @param corporateDAO the corporateDAO to set
	 */
	public void setCorporateDAO(CorporateDAO corporateDAO) {
		this.corporateDAO = corporateDAO;
	}



}
