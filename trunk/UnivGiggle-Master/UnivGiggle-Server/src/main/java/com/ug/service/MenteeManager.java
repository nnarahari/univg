/**
 * 
 */
package com.ug.service;

import java.util.List;

import com.ug.model.Mentee;
import com.ug.model.ResultInfo;
import com.ug.model.Testimonial;

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
	public ResultInfo deleteMentee(Mentee mentee) throws Exception;
	
	
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
	
	
	/**
	 * Add {@link Testimonial} to the {@link Mentee}
	 * @param menteeEmail
	 * @param testimonial
	 * @return
	 * @throws Exception
	 */
	public ResultInfo addTestimonial(String menteeEmail, Testimonial testimonial) throws Exception;
	
	/**
	 * Get all available {@link Testimonial} for the given {@link Mentee}'s email id.
	 * This method returns null if no {@link Testimonial} available for the {@link Mentee}. 
	 * @param menteeEmail
	 * @return
	 * @throws Exception
	 */
	public List<Testimonial> getAllTestimonial(String menteeEmail) throws Exception;
	
	
	/**
	 * Remove the particular {@link Testimonial} from the {@link Mentee}
	 * @param menteeEmail
	 * @param testimonial
	 * @return
	 * @throws Exception
	 */
	public ResultInfo removeTestimonial(String menteeEmail, Testimonial testimonial) throws Exception;
	
	
}
