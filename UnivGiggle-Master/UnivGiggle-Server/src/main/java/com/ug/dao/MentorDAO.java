package com.ug.dao;

import java.util.List;

import com.ug.model.Mentee;
import com.ug.model.Mentor;
import com.ug.model.Testimonial;
/**
 * 
 * @author Anil.J
 *
 */
public interface MentorDAO {
	
	public Mentor createOrUpdateMentor(Mentor mentor) throws Exception;

	public List<Mentor> getAllMentors() throws Exception;

	public List<Mentor> getMentorsByEmail(String email) throws Exception;

	public boolean deleteMentor(Mentor mentor)  throws Exception;
	
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
	 * @throws Exception 
	 */
	public Mentor getMentor(String email) throws Exception;
	
	/**
	 * Remove {@link Mentee} from {@link Mentor}'s list
	 * @param mentorEmail
	 * @param mentee
	 * @return
	 */
	public boolean detachMentee(String mentorEmail, Mentee mentee)throws Exception;
	
	
	/**
	 * Activate {@link Mentor} status by email.
	 * @param mentorId
	 * @return
	 * @throws Exception 
	 */
	public boolean activateMentor(String mentorId) throws Exception;

	
	/**
	 * Get {@link Mentor} details by passing mentor id.
	 * @param mentorId
	 * @return
	 */
	public Mentor getMentorById(String mentorId);
	
	/**
	 * Add {@link Testimonial} to {@link Mentor}
	 * @param mentorEmail
	 * @param testimonial
	 * @return
	 * @throws Exception 
	 */
	public boolean addTestimonial(String mentorEmail, Testimonial testimonial) throws Exception;
	

	public List<Testimonial> getAllTestimonial(String mentorEmail) throws Exception;

	/**
	 * Get {@link Mentor}'s list after applying the filter like country and profession.
	 * @param country
	 * @param profession
	 * @return
	 * @throws Exception 
	 */
	public List<Mentor> getMentors(String country, String profession) throws Exception;
}
