/**
 * 
 */
package com.ug.dao;

import java.util.List;

import com.ug.model.Mentee;
import com.ug.model.Mentor;

/**
 * {@link Mentee} releated DB operations 
 * @author srini
 *
 */
public interface MenteeeDAO {
	
	/**
	 * Add {@link Mentee} into the DB
	 * @param mentee
	 * @return
	 * @throws Exception 
	 */
	public Mentee addMentee(Mentee mentee) throws Exception;
	
	
	/**
	 * Add {@link Mentor} to the {@link Mentee}.
	 * @param menteeEmail
	 * @param mentor
	 * @return
	 */
	public boolean updateMentor(String menteeEmail, Mentor mentor);

	/**
	 * Update the {@link Mentee} with new or modified values.
	 * @param newMentee
	 * @return
	 */
	public boolean updateMentee(Mentee newMentee);

	/**
	 * Get the {@link Mentee} details
	 * @param email
	 * @return
	 */
	public Mentee getMentee(String email);


	/**
	 * Remove {@link Mentee} from the system.
	 * @param mentee
	 */
	public boolean deleteMentee(Mentee mentee)throws Exception;
	
	
	/**
	 * Activate {@link Mentee} status by email.
	 * @param menteeId
	 * @return
	 * @throws Exception 
	 */
	public boolean activateMentee(String menteeId) throws Exception;

	
	/**
	 * Get {@link Mentee} details by passing mentee id.
	 * @param menteeId
	 * @return
	 */
	public Mentee getMenteeById(String menteeId);
	
	/**
	 * returns all available mentees.
	 * @return
	 * @throws Exception
	 */
	public List<Mentee>getAvailableMentees() throws Exception;
	
}
