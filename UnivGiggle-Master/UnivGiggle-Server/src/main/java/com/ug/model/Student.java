/**
 * 
 */
package com.ug.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author srrajend
 *
 */
@Entity
@Table(name="Student")
public class Student extends ModelBase{
	
	private static final long serialVersionUID = 558447798151912608L;

	@Column(name="firstname", length=50, nullable=false)
	private String firstName;
	
	@Column (name="lastname", length=50)
	private String lastName;
	
	@Column(name="email", length=100, unique=true)
	private String email;
	
	@Column (name="gender", length=10, nullable=false)
	private String gender;
	
	@Column (name="country", length=100, nullable=false)
	private String country;
	
	@Column (name="state", length=100, nullable=false)
	private String state;
	
	@Column (name="university", length=100, nullable=false)
	private String university;
	
	@Column (name="program", length=100, nullable=false)
	private String program;
	
	@Column (name="department", length=100, nullable=false)
	private String department;
	
	@Column (name="expgrdmonth", length=20, nullable= false)
	private String expectedGraduationMonth;
	
	@Column (name="resumepath", length=100, nullable = false)
	private String resumePath;
	
	@Column (name="picturepath", length=100)
	private String picturePath;
	
	@Column (name="linkedinprofile", length=200)
	private String linkedInProfile;
	
	@Column (name="studentstory", length=2000)
	private String studentStory;
	
	@Column (name="youtubelink", length=200)
	private String youtubeLink;
	
	@Column (name="activated")
	private boolean activated;
	
	
	@OneToMany(mappedBy="student", cascade=CascadeType.ALL)
	private List<StudentGrant> grantList;


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
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}


	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
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
	 * @return the state
	 */
	public String getState() {
		return state;
	}


	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}


	/**
	 * @return the university
	 */
	public String getUniversity() {
		return university;
	}


	/**
	 * @param university the university to set
	 */
	public void setUniversity(String university) {
		this.university = university;
	}


	/**
	 * @return the program
	 */
	public String getProgram() {
		return program;
	}


	/**
	 * @param program the program to set
	 */
	public void setProgram(String program) {
		this.program = program;
	}


	/**
	 * @return the department
	 */
	public String getDepartment() {
		return department;
	}


	/**
	 * @param department the department to set
	 */
	public void setDepartment(String department) {
		this.department = department;
	}


	/**
	 * @return the expectedGraduationMonth
	 */
	public String getExpectedGraduationMonth() {
		return expectedGraduationMonth;
	}


	/**
	 * @param expectedGraduationMonth the expectedGraduationMonth to set
	 */
	public void setExpectedGraduationMonth(String expectedGraduationMonth) {
		this.expectedGraduationMonth = expectedGraduationMonth;
	}


	/**
	 * @return the resumePath
	 */
	public String getResumePath() {
		return resumePath;
	}


	/**
	 * @param resumePath the resumePath to set
	 */
	public void setResumePath(String resumePath) {
		this.resumePath = resumePath;
	}


	/**
	 * @return the picturePath
	 */
	public String getPicturePath() {
		return picturePath;
	}


	/**
	 * @param picturePath the picturePath to set
	 */
	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}


	/**
	 * @return the linkedInProfile
	 */
	public String getLinkedInProfile() {
		return linkedInProfile;
	}


	/**
	 * @param linkedInProfile the linkedInProfile to set
	 */
	public void setLinkedInProfile(String linkedInProfile) {
		this.linkedInProfile = linkedInProfile;
	}


	/**
	 * @return the studentStory
	 */
	public String getStudentStory() {
		return studentStory;
	}


	/**
	 * @param studentStory the studentStory to set
	 */
	public void setStudentStory(String studentStory) {
		this.studentStory = studentStory;
	}


	/**
	 * @return the youtubeLink
	 */
	public String getYoutubeLink() {
		return youtubeLink;
	}


	/**
	 * @param youtubeLink the youtubeLink to set
	 */
	public void setYoutubeLink(String youtubeLink) {
		this.youtubeLink = youtubeLink;
	}


	/**
	 * @return the grantList
	 */
	public List<StudentGrant> getGrantList() {
		return grantList;
	}


	/**
	 * @param grantList the grantList to set
	 */
	public void setGrantList(List<StudentGrant> grantList) {
		this.grantList = grantList;
	}


	/**
	 * @return the country
	 */
	public String getCountry() {
		return country;
	}


	/**
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
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
	
	
	
}
