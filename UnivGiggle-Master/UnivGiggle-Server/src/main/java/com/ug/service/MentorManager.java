/**
 * 
 */
package com.ug.service;

import com.ug.model.Mentee;
import com.ug.model.Mentor;
import com.ug.model.ResultInfo;

/**
 * @author srini
 *
 */
public interface MentorManager {
	/**
	 * Create new {@link Mentor} in to the system.
	 * @param mentor
	 * @param imageFileName
	 * @param imageData
	 * @return {@link ResultInfo}
	 * @throws Exception 
	 */
	public ResultInfo addMentor(Mentor mentor, String imageFileName, byte[] imageData) throws Exception;
	
	
	/**
	 * Delete {@link Mentor} from the system.
	 * @param mentor
	 * @return
	 */
	public ResultInfo removeMentor(Mentor mentor);
	
	
	/**
	 * Retrieve the {@link Mentor} details from system. 
	 * @param email
	 * @return
	 */
	public Mentor getMentor(String email);
	
	/**
	 * Update the existing {@link Mentor} details.
	 * @param mentor
	 * @return
	 * @throws Exception 
	 */
	public ResultInfo updateMentor(Mentor mentor) throws Exception;
	
	/**
	 * Add new {@link Mentee} to the {@link Mentor}'s list
	 * @param mentee
	 * @param mentorEmail
	 * @return
	 */
	public ResultInfo addMentee(String mentorEmail, Mentee mentee);
	
	/**
	 * Remove the {@link Mentee} from {@link Mentor}'s list
	 * @param mentorEmail
	 * @param mentee
	 * @return
	 */
	public ResultInfo removeMentee(String mentorEmail, Mentee mentee);

}
