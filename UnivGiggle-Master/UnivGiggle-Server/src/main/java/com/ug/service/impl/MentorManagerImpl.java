/**
 * 
 */
package com.ug.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ug.dao.MentorDAO;
import com.ug.model.Mentee;
import com.ug.model.Mentor;
import com.ug.model.ResultInfo;
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
	public ResultInfo removeMentor(Mentor mentor) {
		// TODO Auto-generated method stub
		return null;
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
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentor added Successfully!", "0", "Mentor added Successfully!", newMentor);
		}
		return resultInfo;
	}
	
	@Override
	public ResultInfo removeMentee(String mentorEmail, Mentee mentee) {
		logger.info("removeMentee() started...");
		ResultInfo resultInfo = null;
		boolean isMenteeRemoved = mentorDAO.removeMentee(mentorEmail, mentee);
		if(isMenteeRemoved)
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Mentee removed successfully!", "0", "Mentee removed successfully!", null);
		else
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Removing Mentee failed", "104", "Removing Mentee failed.", null);
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

	

}
