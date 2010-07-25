/**
 * 
 */
package com.ug.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author srini
 *
 */
@Entity
@Table(name="Mentee")
public class Mentee extends ModelBase{

	/**
	 * 
	 */
	private static final long serialVersionUID = 232321719528203914L;

	@Column(name="firstname", length=50, nullable=false)
	private String firstName;
	
	@Column (name="lastname", length=50)
	private String lastName;
	
	@Column(name="email", length=100, unique=true)
	private String email;
	
	@Column (name="gender", length=10, nullable=false)
	private String gender;
	
	@Column (name="age", length=100, nullable = false)
	private String age;
	
	@Column (name="citizenship", length=100, nullable = false)
	private String citizenship;
	
	@Column (name="language", length=100, nullable = false)
	private String language;
	
	@Column (name="profession", length=100, nullable = false)
	private String profession;
	
	@Column (name="degree", length=100, nullable = false)
	private String degree;
		
	@Column (name="schoolcollege", length=100)
	private String schoolCollege;
	
	@Column (name="description", length=2000)
	private String description;
	
	@Column (name="imagepaths", length=200)
	private String imagePaths;
	
	@Column (name="testimonial", length=2000)
	private String testimonial;
	
	@Column(name="isactivated", nullable=false)
	private boolean activated;
	
	@ManyToOne
	private Mentor mentor;
	
	public Mentee(){
		
	}

	/**
	 * @param firstName
	 * @param lastName
	 * @param email
	 */
	public Mentee(String firstName, String lastName, String email) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
	}

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
	 * @return the age
	 */
	public String getAge() {
		return age;
	}

	/**
	 * @param age the age to set
	 */
	public void setAge(String age) {
		this.age = age;
	}

	/**
	 * @return the citizenship
	 */
	public String getCitizenship() {
		return citizenship;
	}

	/**
	 * @param citizenship the citizenship to set
	 */
	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}

	/**
	 * @return the language
	 */
	public String getLanguage() {
		return language;
	}

	/**
	 * @param language the language to set
	 */
	public void setLanguage(String language) {
		this.language = language;
	}

	/**
	 * @return the profession
	 */
	public String getProfession() {
		return profession;
	}

	/**
	 * @param profession the profession to set
	 */
	public void setProfession(String profession) {
		this.profession = profession;
	}

	/**
	 * @return the degree
	 */
	public String getDegree() {
		return degree;
	}

	/**
	 * @param degree the degree to set
	 */
	public void setDegree(String degree) {
		this.degree = degree;
	}

	/**
	 * @return the schoolCollege
	 */
	public String getSchoolCollege() {
		return schoolCollege;
	}

	/**
	 * @param schoolCollege the schoolCollege to set
	 */
	public void setSchoolCollege(String schoolCollege) {
		this.schoolCollege = schoolCollege;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the imagePaths
	 */
	public String getImagePaths() {
		return imagePaths;
	}

	/**
	 * @param imagePaths the imagePaths to set
	 */
	public void setImagePaths(String imagePaths) {
		this.imagePaths = imagePaths;
	}

	/**
	 * @return the testimonial
	 */
	public String getTestimonial() {
		return testimonial;
	}

	/**
	 * @param testimonial the testimonial to set
	 */
	public void setTestimonial(String testimonial) {
		this.testimonial = testimonial;
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

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Mentee [firstName=");
		builder.append(firstName);
		builder.append(" , lastName=");
		builder.append(lastName);
		builder.append(" , age=");
		builder.append(age);
		builder.append(" , gender=");
		builder.append(gender);
		builder.append(" , citizenship=");
		builder.append(citizenship);
		builder.append(" , email=");
		builder.append(email);
		builder.append(" , profession=");
		builder.append(profession);
		builder.append("]");
		return builder.toString();
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
	@Override
	public boolean equals(Object obj) {
		Mentee menteeObj = (Mentee)obj;
		return email.endsWith(menteeObj.getEmail());
	}
}
