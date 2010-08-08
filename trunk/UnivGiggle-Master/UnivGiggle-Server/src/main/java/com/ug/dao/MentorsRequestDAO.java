/**
 * 
 */
package com.ug.dao;

import com.ug.model.MentorsRequest;

/**
 * @author srrajend
 *
 */
public interface MentorsRequestDAO {
	
	public boolean addMentorsRequest(MentorsRequest mentorsRequest);
	
	public boolean removeMentorsRequest(String mentorEmail, String menteeEmail);
	
	

}
