/**
 * 
 */
package com.ug.service;

import java.util.Date;
import java.util.List;

import com.ug.model.Mentee;
import com.ug.model.Mentor;
import com.ug.model.ResultInfo;
import com.ug.model.Testimonial;

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
	public ResultInfo deleteMentor(Mentor mentor)throws Exception;
	
	
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
	public ResultInfo detachMentee(String mentorEmail, Mentee mentee)throws Exception;
	
	
	/**
	 * Activate {@link Mentor}'s profile.
	 * @param mentorId
	 * @return
	 * @throws Exception 
	 */
	public boolean activateMentor(String mentorId) throws Exception;
	
	
	/**
	 * Add {@link Testimonial} to the {@link Mentor}
	 * @param mentorEmail
	 * @param testimonial
	 * @return
	 * @throws Exception
	 */
	public ResultInfo addTestimonial(String mentorEmail, Testimonial testimonial) throws Exception;
	
	/**
	 * Get all available {@link Testimonial} for the given {@link Mentor}'s email id.
	 * This method returns null if no {@link Testimonial} available for the {@link Mentor}. 
	 * @param mentorEmail
	 * @return
	 * @throws Exception
	 */
	public List<Testimonial> getAllTestimonial(String mentorEmail) throws Exception;
	
	
	/**
	 * Remove the particular {@link Testimonial} from the {@link Mentor}
	 * @param mentorEmail
	 * @param testimonial
	 * @return
	 * @throws Exception
	 */
	public ResultInfo removeTestimonial(String mentorEmail, Testimonial testimonial) throws Exception;
	
	
	
	/**
	 * Get {@link Mentor}s in the system with filter applied.
	 * @param country
	 * @param profession
	 * @return
	 * @throws Exception
	 */
	public List<Mentor> getMentors(String country, String profession) throws Exception;
	
	
	/**
	 * Get all the {@link Mentor}s available in the system.
	 * @return
	 * @throws Exception
	 */
	public List<Mentor> getAllMentors() throws Exception;
	
	
	
	public List<Mentee> getMenteesRequest(String mentorEmail) throws Exception;
	
	
	
	
	

}
