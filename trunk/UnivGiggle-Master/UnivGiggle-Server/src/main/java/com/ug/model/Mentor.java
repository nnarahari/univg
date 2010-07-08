package com.ug.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="Mentor")
public class Mentor extends ModelBase{
	
	private static final long serialVersionUID = -579141741018995876L;

	@Column(name="firstname", length=50, nullable=false)
	private String firstName;
	
	@Column (name="lastname", length=100)
	private String lastName;
	
	@Column(name="email", length=100, nullable=false)
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
		
	@Column (name="schoolcollege", length=100, nullable = false)
	private String schoolCollege;
	
	@Column (name="description", length=2000, nullable = false)
	private String description;
	
	@Column (name="imagepaths", length=2000)
	private String imagePaths;
	
	@Column (name="testimonial", length=1000, nullable = false)
	private String testimonial;
	
	@Column (name="verificationcode", length=100, nullable = false)
	private String verificationCode;

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

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}
	
	
}
