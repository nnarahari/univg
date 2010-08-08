/**
 * 
 */
package com.ug.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.ug.dao.MenteeeDAO;
import com.ug.dao.MentorDAO;
import com.ug.dao.MentorsRequestDAO;
import com.ug.model.Mentee;
import com.ug.model.Mentor;
import com.ug.model.MentorsRequest;
import com.ug.model.ResultInfo;
import com.ug.model.Testimonial;
import com.ug.service.MentorManager;
import com.ug.util.UnivGiggleUtil;

/**
 * @author srini
 *
 */
public class MentorManagerImpl implements MentorManager {

	private Logger logger = Logger.getLogger(MentorManagerImpl.class);
	private static final String MODULE_NAME = "mentor";

	@Autowired
	private MentorDAO mentorDAO;
	private MentorsRequestDAO mentorsRequestDAO;
	private MenteeeDAO menteeDAO;
	private VelocityEngine velocityEngine;
	private JavaMailSender mailSender;
	
	private String imageAppURL;
	private String imageWebURL;
	
	
	
	/* (non-Javadoc)
	 * @see com.ug.service.MentorManager#getMentor(java.lang.String)
	 */
	@Override 
	public Mentor getMentor(String email) {
		logger.info("getMentor() started..");
		Mentor mentor = mentorDAO.getMentor(email);
		return mentor;
	}

	/* (non-Javadoc)
	 * @see com.ug.service.MentorManager#removeMentor(com.ug.model.Mentor)
	 */
	@Override
	public ResultInfo deleteMentor(Mentor mentor)throws Exception {
		
		logger.info("deleteMentor() started...");
		ResultInfo resultInfo = null;
		boolean isMentorDeleted = mentorDAO.deleteMentor(mentor);
		if(isMentorDeleted)
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentor removed successfully!", "0", "Mentee removed successfully!", null);
		else
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Mentor removal failed", "104", "Removing Mentee failed.", null);
		return resultInfo;
	}

	/* (non-Javadoc)
	 * @see com.ug.service.MentorManager#updateMentor(com.ug.model.Mentor)
	 */
	@Override
	public ResultInfo updateMentor(Mentor mentor) throws Exception {
		logger.info("updateMentor() started...");
		ResultInfo resultInfo = null;
		Mentor newMentor = mentorDAO.createOrUpdateMentor(mentor);
		if(newMentor != null)
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentor updated successfully!", "0", "Mentor updated successfully!", null);
		else
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentor update failed!", "102", "Error while updating mentor details.", null);
		return resultInfo;
	}

	/* (non-Javadoc)
	 * @see com.ug.service.MentorManager#addMentor(Mentor, String, byte[])
	 */
	@Override
	@Transactional
	public ResultInfo addMentor(Mentor mentor, String imageFileName, byte[] imageData) throws Exception {
		logger.info("addMentor started()");
		ResultInfo resultInfo = null;
		boolean isMenteeAdded = false;
		Mentor newMentor = mentorDAO.createOrUpdateMentor(mentor);
		if(newMentor != null){
			logger.info("New mentor Id ==>" + newMentor.getId());
			if(imageData != null && imageFileName != null){
				logger.info("Image uploaded with mentor.. storing the image..");
				String imagePath = UnivGiggleUtil.storeImage(imageFileName, imageData, newMentor.getId(),MODULE_NAME,imageAppURL,imageWebURL );
				if(imagePath != null){
					logger.info("updating image in mentor's details..");
					newMentor.setImagePaths(imagePath);
					Mentor mentor1 = mentorDAO.createOrUpdateMentor(newMentor);
					if((mentor1 != null) && (mentor1.getImagePaths() != null)){
						logger.info("Mentor image path updated successfully!");
						isMenteeAdded = true;
					}else{
						logger.error("Mentor image path not updated in DB");
						resultInfo = UnivGiggleUtil.createResultInfo(false, "Mentor added Failed!", "101", "Error while updating mentor image path", newMentor);
					}
				}else{
					resultInfo = UnivGiggleUtil.createResultInfo(false, "Mentor added Failed!", "102", "Error while storing mentor image.", newMentor);
					logger.error("Error while storing the mentor image.");
				}
			}else{
				logger.info("No images to save..");
				isMenteeAdded = true;
			}
			
		}else{
			logger.error("Adding new Mentor failed..");
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Mentor added Failed!", "102", "Error while storing mentor details.", newMentor);
			isMenteeAdded = false;
		}
		if(isMenteeAdded){
			logger.info("sending mail confirmation to mentor...");
			sendConfirmationMail(newMentor);
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentor added Successfully!", "0", "Mentor added Successfully!", newMentor);
		}
		return resultInfo;
	}
	
	@Override
	public ResultInfo detachMentee(String mentorEmail, Mentee mentee)throws Exception {
		logger.info("removeMentee() started...");
		ResultInfo resultInfo = null;
		boolean isMenteeRemoved = mentorDAO.detachMentee(mentorEmail, mentee);
		if(isMenteeRemoved)
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentee detached successfully!", "0", "Mentee removed successfully!", null);
		else
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Detaching Mentee failed", "104", "Removing Mentee failed.", null);
		return resultInfo;
	}

	@Override
	public ResultInfo addMentee(String mentorEmail, Mentee mentee) {
		logger.info("addMentee() started...");
		ResultInfo resultInfo = null;
		boolean isMenteeAdded = mentorDAO.addMentee(mentorEmail, mentee);
		logger.info("isMenteeAdded ==>"+ isMenteeAdded);
		if(isMenteeAdded)
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentee added Successfully!", "0", "Mentee added Successfully!", null);
		else
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Adding Mentee failed", "103", "Adding Mentee failed.", null);
		return resultInfo;
	}
	
	@Override
	public List<Mentee> getMenteesRequest(String mentorEmail) throws Exception {
		logger.info("getMenteesRequest() started...mentorEmail ==>"+ mentorEmail);
		List<MentorsRequest> mentorReqList = mentorsRequestDAO.getRequestsForMentor(mentorEmail);
		List<Mentee> menteesList = new ArrayList<Mentee>();
		if(null != mentorReqList){
			logger.info("MentorsReq size ==>" +mentorReqList.size());
			for (Iterator<MentorsRequest> iterator = mentorReqList.iterator(); iterator.hasNext();) {
				MentorsRequest mentorsRequest = iterator.next();
				Mentee mentee = menteeDAO.getMentee(mentorsRequest.getMenteeEmail());
				if(mentee != null)
					menteesList.add(mentee);
			}
		}
		return menteesList;
	}

	private void sendConfirmationMail(final Mentor mentor){
		logger.info("inside sendConfirmationMail()");
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
               MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
               message.setTo(mentor.getEmail());
               message.setSubject("UnivGiggle Mentor Confirmation");
               Map model = new HashMap();
               model.put("mentor", mentor);
               String text = VelocityEngineUtils.mergeTemplateIntoString(
                  velocityEngine, "MentorConfirmation.vm", model);
               logger.info("Mail content :: \n" + text);
               message.setText(text, true);
            }
         };
         this.mailSender.send(preparator);
	}
	
	/**
	 * @param mentorDAO the mentorDAO to set
	 */
	public void setMentorDAO(MentorDAO mentorDAO) {
		this.mentorDAO = mentorDAO;
	}

	/**
	 * @param imageAppURL the imageAppURL to set
	 */
	public void setImageAppURL(String imageAppURL) {
		this.imageAppURL = imageAppURL;
	}

	/**
	 * @param imageWebURL the imageWebURL to set
	 */
	public void setImageWebURL(String imageWebURL) {
		this.imageWebURL = imageWebURL;
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
	public boolean activateMentor(String mentorId) throws Exception {
		logger.info("activateMentor() started...");
		return mentorDAO.activateMentor(mentorId);
	}

	@Override
	public ResultInfo addTestimonial(String mentorEmail, Testimonial testimonial)throws Exception {
		logger.info("addTestimonial() started...");
		ResultInfo resultInfo = null;
		boolean isTMAdded = mentorDAO.addTestimonial(mentorEmail,testimonial);
		if(isTMAdded){
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Testimonial added Successfully!", "0", "Testimonial added Successfully!", null);
		}else{
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Adding Testimonial failed.", "108", "Adding Testimonial failed.", null);
		}
		return resultInfo;
	}

	@Override 
	public List<Testimonial> getAllTestimonial(String mentorEmail) 	throws Exception {
		logger.info("getAllTestimonial() started...");
		List<Testimonial> listTestimonials = mentorDAO.getAllTestimonial(mentorEmail);
		if(listTestimonials == null){
			logger.error("There is no Testimonial available...");
			return null;
		}else{
			return listTestimonials;
		}
	}

	@Override
	public ResultInfo removeTestimonial(String mentorEmail, Testimonial testimonial) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Mentor> getAllMentors() throws Exception {
		logger.info("getAllMentors() started...");
		List<Mentor> modifiedMentorList = new ArrayList<Mentor>();
		List<Mentor> mentorList = mentorDAO.getAllMentors();
		for (Iterator iterator = mentorList.iterator(); iterator.hasNext();) {
			Mentor mentor = (Mentor) iterator.next();
			mentor.setTestmonialList(null);
			mentor.setMenteeList(null);
			modifiedMentorList.add(mentor);
		}
		logger.info("modifiedMentorList size ==>"+ modifiedMentorList.size());
		return modifiedMentorList;
	}

	@Override
	public List<Mentor> getMentors(String country, String profession)throws Exception {
		logger.info("getMentors() started...");
		return mentorDAO.getMentors(country,profession);
	}

	

	/**
	 * @param mentorsRequestDAO the mentorsRequestDAO to set
	 */
	public void setMentorsRequestDAO(MentorsRequestDAO mentorsRequestDAO) {
		this.mentorsRequestDAO = mentorsRequestDAO;
	}

	/**
	 * @param menteeDAO the menteeDAO to set
	 */
	public void setMenteeDAO(MenteeeDAO menteeDAO) {
		this.menteeDAO = menteeDAO;
	}

	

}
