/**
 * 
 */
package com.ug.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author srrajend
 * {@link Mentee}'s request to {@link Mentors} will be stored to this entity.
 */
@Entity
@Table(name="MentorsRequest")
public class MentorsRequest extends ModelBase {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4215540652191470800L;
	
	@Column(name="mentoremail", nullable=false, length=50)
	private String mentorEmail;
	
	@Column(name="menteeemail", nullable=false, length=50)
	private String menteeEmail;
	
	@Column(name="requesteddate")
	private Date requestedDate;

	/**
	 * @return the mentorEmail
	 */
	public String getMentorEmail() {
		return mentorEmail;
	}

	/**
	 * @param mentorEmail the mentorEmail to set
	 */
	public void setMentorEmail(String mentorEmail) {
		this.mentorEmail = mentorEmail;
	}

	/**
	 * @return the menteeEmail
	 */
	public String getMenteeEmail() {
		return menteeEmail;
	}

	/**
	 * @param menteeEmail the menteeEmail to set
	 */
	public void setMenteeEmail(String menteeEmail) {
		this.menteeEmail = menteeEmail;
	}

	/**
	 * @return the requestedDate
	 */
	public Date getRequestedDate() {
		return requestedDate;
	}

	/**
	 * @param requestedDate the requestedDate to set
	 */
	public void setRequestedDate(Date requestedDate) {
		this.requestedDate = requestedDate;
	}

	/**
	 * @param mentorEmail
	 * @param menteeEmail
	 * @param requestedDate
	 */
	public MentorsRequest(String mentorEmail, String menteeEmail, Date requestedDate) {
		super();
		this.mentorEmail = mentorEmail;
		this.menteeEmail = menteeEmail;
		this.requestedDate = requestedDate;
	}
	
	/**
	 * Default constructor.
	 */
	public MentorsRequest(){
		
	}
	
	

}
