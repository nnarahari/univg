/**
 * 
 */
package com.ug.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author srrajend
 *
 */
@Entity
@Table(name="Testimonial")
public class Testimonial extends ModelBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = -834993346086391922L;
	
	
	@Column(name="touser", length=50, nullable=false)
	private String toUser;
	
	@Column(name="fromuser", length=50, nullable=false)
	private String fromUser;
	
	@Column(name="wrotedate", nullable= false)
	private Date wroteDate;
	
	@Column(name="content", length=2000, nullable=false)
	private String content;
	
	@ManyToOne
	private Mentee mentee;
	
	@ManyToOne
	private Mentor mentor;

	/**
	 * @return the toUser
	 */
	public String getToUser() {
		return toUser;
	}

	/**
	 * @param toUser the toUser to set
	 */
	public void setToUser(String toUser) {
		this.toUser = toUser;
	}

	/**
	 * @return the fromUser
	 */
	public String getFromUser() {
		return fromUser;
	}

	/**
	 * @param fromUser the fromUser to set
	 */
	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}

	/**
	 * @return the wroteDate
	 */
	public Date getWroteDate() {
		return wroteDate;
	}

	/**
	 * @param wroteDate the wroteDate to set
	 */
	public void setWroteDate(Date wroteDate) {
		this.wroteDate = wroteDate;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the mentee
	 */
	public Mentee getMentee() {
		return mentee;
	}

	/**
	 * @param mentee the mentee to set
	 */
	public void setMentee(Mentee mentee) {
		this.mentee = mentee;
	}

	/**
	 * @return the mentor
	 */
	public Mentor getMentor() {
		return mentor;
	}

	/**
	 * @param mentor the mentor to set
	 */
	public void setMentor(Mentor mentor) {
		this.mentor = mentor;
	}

	/**
	 * @param toUser
	 * @param fromUser
	 * @param wroteDate
	 * @param content
	 */
	public Testimonial(String toUser, String fromUser, Date wroteDate, String content) {
		super();
		this.toUser = toUser;
		this.fromUser = fromUser;
		this.wroteDate = wroteDate;
		this.content = content;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Testimonial [content=");
		builder.append(content);
		builder.append(", fromUser=");
		builder.append(fromUser);
		builder.append(", toUser=");
		builder.append(toUser);
		builder.append(", wroteDate=");
		builder.append(wroteDate);
		builder.append("]");
		return builder.toString();
	}

	/**
	 * 
	 */
	public Testimonial() {
		super();
	}
	
	
	

}
