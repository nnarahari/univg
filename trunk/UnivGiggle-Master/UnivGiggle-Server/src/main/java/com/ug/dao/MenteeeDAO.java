/**
 * 
 */
package com.ug.dao;

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
	public boolean removeMentee(Mentee mentee);
	
	

}
