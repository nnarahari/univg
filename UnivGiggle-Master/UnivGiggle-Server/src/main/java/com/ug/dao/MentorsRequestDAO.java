/**
 * 
 */
package com.ug.dao;

import java.util.List;

import com.ug.model.MentorsRequest;

/**
 * @author srrajend
 *
 */
public interface MentorsRequestDAO {
	
	public boolean addMentorsRequest(MentorsRequest mentorsRequest);
	
	public boolean removeMentorsRequest(String mentorEmail, String menteeEmail);
	
	public List<MentorsRequest> getRequestsForMentor(String mentorEmail) throws Exception;
	
	

}
