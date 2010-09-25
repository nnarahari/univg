package com.ug.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name="Mentor")
public class Mentor extends ModelBase{
	
	private static final long serialVersionUID = -579141741018995876L;
	
	
	public Mentor(){
		
	}
	/**
	 * @param firstName
	 * @param lastName
	 */
	public Mentor(String firstName, String lastName,String email) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
	}

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
	
	@OneToMany(mappedBy="mentor", cascade=CascadeType.ALL)
	@OrderBy("firstName ASC")
	private List<Mentee> menteeList;
	
	@OneToMany(mappedBy="mentor", cascade=CascadeType.ALL)
	private List<Testimonial> testmonialList;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getCitizenship() {
		return citizenship;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getSchoolCollege() {
		return schoolCollege;
	}

	public void setSchoolCollege(String schoolCollege) {
		this.schoolCollege = schoolCollege;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImagePaths() {
		return imagePaths;
	}

	public void setImagePaths(String imagePaths) {
		this.imagePaths = imagePaths;
	}

	public String getTestimonial() {
		return testimonial;
	}

	public void setTestimonial(String testimonial) {
		this.testimonial = testimonial;
	}


	/**
	 * @return the menteeList
	 */
	public List<Mentee> getMenteeList() {
		return menteeList;
	}

	/**
	 * @param menteeList the menteeList to set
	 */
	public void setMenteeList(List<Mentee> menteeList) {
		this.menteeList = menteeList;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Mentor [firstName=");
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
		builder.append(" , menteeList=");
		builder.append(menteeList);
		builder.append(" , testmonialList=");
		builder.append(testmonialList);
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
	/**
	 * @return the testmonialList
	 */
	public List<Testimonial> getTestmonialList() {
		return testmonialList;
	}
	/**
	 * @param testmonialList the testmonialList to set
	 */
	public void setTestmonialList(List<Testimonial> testmonialList) {
		this.testmonialList = testmonialList;
	}
	
	
}
