/**
 * 
 */
package com.ug.service;

import java.util.List;

import com.ug.model.Classified;
import com.ug.model.ResultInfo;

/**
 * @author srajen03
 *
 */
public interface ClassifiedManager {
	
	public ResultInfo addClassified(Classified classified,List<String> fileNameList, List<byte []> imageDataList) throws Exception;
	
	public ResultInfo updateConfirmationStatus(String classifiedId) throws Exception;
	
	public List<Classified> getListClassifieds(String country, String state, String university, String searchText) throws Exception;
	
	//public boolean storeClassifiedImages(List<String> fileNameList, List<byte []> imageData, Long classifiedId);
	
	
	
	/**
	 * Any logged in {@link UG_User} can reply to the {@link Classified}. 
	 * Reply will go as mail to the {@link Classified} owner.
	 * @param userEmail - logged in user email
	 * @param classifiedId
	 * @param replyMessage
	 * @return
	 */
	public boolean replyToClassified(String userEmail, String classifiedId, String replyMessage);
	
	
	/**
	 * Forward the {@link Classified} detail as link to given email.
	 * @param userEmail
	 * @param classifiedId
	 * @param toEmail
	 * @return
	 */
	public boolean forwardClassified(String userEmail, String classifiedId, String toEmail);
	
	
}
