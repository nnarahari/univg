/**
 * 
 */
package com.ug.service;

import java.util.List;

import com.ug.model.Mentee;
import com.ug.model.ResultInfo;

/**
 * @author srini
 *
 */
public interface MenteeManager {

	/**
	 * Create new {@link Mentee} in to the system.
	 * @param mentee
	 * @param imageFileName
	 * @param imageData
	 * @return (@link ResultInfo}
	 * @throws Exception 
	 */
	public ResultInfo addMentee(Mentee mentee, String imageFileName, byte[] imageData) throws Exception;
	
	
	/**
	 * Delete {@link Mentee} from the system.
	 * @param mentee
	 * @return
	 */
	public ResultInfo removeMentee(Mentee mentee);
	
	
	/**
	 * Retrieve the {@link Mentee} details from system. 
	 * @param email
	 * @return
	 */
	public Mentee getMentee(String email);
	
	/**
	 * Update the existing {@link Mentee} details.
	 * @param mentee
	 * @return
	 */
	public ResultInfo updateMentee(Mentee mentee);
	
	
	/**
	 * Get all the {@link Mentee}s who doesn't have mentor
	 * @return
	 */
	public List<Mentee> getAvailableMentees() throws Exception;
	
	
	/**
	 * Activate {@link Mentee}
	 * @param menteeId
	 * @return
	 * @throws Exception 
	 */
	public boolean activateMentee(String menteeId) throws Exception;
	
}
