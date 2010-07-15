/**
 * 
 */
package com.ug.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.ug.dao.MenteeeDAO;
import com.ug.model.Mentee;
import com.ug.model.ResultInfo;
import com.ug.service.MenteeManager;
import com.ug.util.UnivGiggleUtil;

/**
 * @author srini
 *
 */
public class MenteeManagerImpl implements MenteeManager {

	@Autowired
	private MenteeeDAO menteeDAO;
	
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
		Mentee mentee = menteeDAO.getMentee(email);
		logger.info ("Mentee Details ==>" + mentee);
		return mentee;
	}

	/* (non-Javadoc)
	 * @see com.ug.service.MenteeManager#removeMentee(com.ug.model.Mentee)
	 */
	@Override
	public ResultInfo removeMentee(Mentee mentee) {
		logger.info("removeMentee() started..");
		boolean isRemoved = menteeDAO.removeMentee(mentee);
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
	public List<Mentee> getAvailableMentees() {
		// TODO Auto-generated method stub
		return null;
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



	

}
