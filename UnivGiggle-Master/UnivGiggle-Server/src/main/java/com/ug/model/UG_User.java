/**
 * 
 */
package com.ug.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author srini
 *
 */
@Entity
@Table(name="UG_User")
public class UG_User extends ModelBase{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4885397730098188253L;
	
	@Column(name="firstname", nullable=false, length=50)
	private String firstName;
	
	@Column(name="lastname", length=50)
	private String lastName;
	
	@Column(name="gender", length=10)
	private String gender;
	
	@Column(name="dob", nullable=false)
	private Date dob;
	
	@Column(name="email",unique=true, length=50)
	private String emailId;
	
	@Column(name="contactno", length=20)
	private String contactNo;
	
	@Column(name="password", length=50, nullable=false)
	private String password;
	
	@Column(name="passwordquestion", length=200)
	private String passwordQuestion;
	
	@Column(name="passwordanswer", length=250)
	private String passwordAnswer;
	
	@Column (name="activated" )
	private boolean activated;
	
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	/**
	 * @return the lastName
	 */
	
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/**
	 * @return the gender
	 */
	
	public String getGender() {
		return gender;
	}
	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}
	/**
	 * @return the dob
	 */
	
	public Date getDob() {
		return dob;
	}
	/**
	 * @param dob the dob to set
	 */
	public void setDob(Date dob) {
		this.dob = dob;
	}
	/**
	 * @return the emailId
	 */
	
	public String getEmailId() {
		return emailId;
	}
	/**
	 * @param emailId the emailId to set
	 */
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	/**
	 * @return the password
	 */
	
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the contactNo
	 */
	public String getContactNo() {
		return contactNo;
	}
	/**
	 * @param contactNo the contactNo to set
	 */
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	/**
	 * @return the passwordQuestion
	 */
	public String getPasswordQuestion() {
		return passwordQuestion;
	}
	/**
	 * @param passwordQuestion the passwordQuestion to set
	 */
	public void setPasswordQuestion(String passwordQuestion) {
		this.passwordQuestion = passwordQuestion;
	}
	/**
	 * @return the passwordAnswer
	 */
	public String getPasswordAnswer() {
		return passwordAnswer;
	}
	/**
	 * @param passwordAnswer the passwordAnswer to set
	 */
	public void setPasswordAnswer(String passwordAnswer) {
		this.passwordAnswer = passwordAnswer;
	}
	/**
	 * @return the activated
	 */
	public boolean isActivated() {
		return activated;
	}
	/**
	 * @param activated the activated to set
	 */
	public void setActivated(boolean activated) {
		this.activated = activated;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuffer sbf = new StringBuffer();
		sbf.append("###### User #####\n");
		sbf.append("FirstName : "+ getFirstName() + "\n");
		sbf.append("LastName  : "+ getLastName()  + "\n");
		sbf.append("Email Id  : "+ getEmailId() + "\n");
		sbf.append("DOB       : "+ getDob()+ "\n");
		sbf.append("Gender    : "+ getGender()+ "\n");
		//sbf.
		return super.toString();
	}

}
