package com.ug.dao;

import java.util.List;

import com.ug.model.Mentee;
import com.ug.model.Mentor;
/**
 * 
 * @author Anil.J
 *
 */
public interface MentorDAO {
	
	public Mentor createOrUpdateMentor(Mentor mentor) throws Exception;

	public List<Mentor> getAllMentors() throws Exception;

	public List<Mentor> getMentorsByEmail(String email) throws Exception;

	public void deleteMentor(Mentor mentor)  throws Exception;
	
	/**
	 * Add {@link Mentee} to {@link Mentor}
	 * @param mentorEmail
	 * @param mentee
	 * @return
	 */
	public boolean addMentee(String mentorEmail, Mentee mentee);

	/**
	 * Get the {@link Mentor} details from DB.
	 * @param email
	 * @return
	 */
	public Mentor getMentor(String email);
	
	/**
	 * Remove {@link Mentee} from {@link Mentor}'s list
	 * @param mentorEmail
	 * @param mentee
	 * @return
	 */
	public boolean removeMentee(String mentorEmail, Mentee mentee);
}
