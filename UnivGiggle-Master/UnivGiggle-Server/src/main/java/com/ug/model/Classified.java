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
@Table(name="Classified")
public class Classified extends ModelBase{

	private static final long serialVersionUID = -579141741018995876L;
	
	@Column (name="country", length = 100, nullable = false)
	private String country;
	
	@Column (name="state", length=100, nullable = false)
	private String state;
	
	@Column(name="universityname", length=100, nullable=false)
	private String universityName;
	
	@Column(name="firstname", length=50, nullable=false)
	private String firstName;
	
	@Column (name="lastname", length=100)
	private String lastName;
	
	@Column(name="showdersonaldetail")
	private boolean showPersonalDetail;

	@Column(name="email", length=100, nullable=false)
	private String email;
	
	@Column(name="contactno", length=20, nullable=false)
	private String contactNo;
	
	@Column(name="timetocontact", length=30)
	private String timeToContact;

	@Column(name="category", length=50, nullable=false)
	private String category;
	
	@Column(name="subcategory", length=50)
	private String subCategory;
	
	@Column(name="title", length=250, nullable=false)
	private String title;
	
	@Column(name="price", length=10)
	private String price;
	
	@Column(name="currency", length=20)
	private String currency;
	
	@Column(name="details", length=2000, nullable=false)
	private String details;
	
	@Column(name="isactivated", nullable=false)
	private boolean activated;
	
	@Column(name="posteddatetime", nullable=false)
	private Date postedDateTime;
	
	@Column (name="expired")
	private boolean expired;
	
	@Column (name="imagepaths", length=2000)
	private String imagePaths;

	/**
	 * @return the showPersonalDetail
	 */
	
	public boolean isShowPersonalDetail() {
		return showPersonalDetail;
	}
	/**
	 * @param showPersonalDetail the showPersonalDetail to set
	 */
	public void setShowPersonalDetail(boolean showPersonalDetail) {
		this.showPersonalDetail = showPersonalDetail;
	}
	/**
	 * @return the timeToContact
	 */
	
	public String getTimeToContact() {
		return timeToContact;
	}
	/**
	 * @param timeToContact the timeToContact to set
	 */
	public void setTimeToContact(String timeToContact) {
		this.timeToContact = timeToContact;
	}
	/**
	 * @return the category
	 */
	
	public String getCategory() {
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}
	/**
	 * @return the subCategory
	 */
	
	public String getSubCategory() {
		return subCategory;
	}
	/**
	 * @param subCategory the subCategory to set
	 */
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	/**
	 * @return the title
	 */
	
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the price
	 */
	
	public String getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(String price) {
		this.price = price;
	}
	/**
	 * @return the currency
	 */
	
	public String getCurrency() {
		return currency;
	}
	/**
	 * @param currency the currency to set
	 */
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	/**
	 * @return the details
	 */
	
	public String getDetails() {
		return details;
	}
	/**
	 * @param details the details to set
	 */
	public void setDetails(String details) {
		this.details = details;
	}
	
	/**
	 * @return the universityName
	 */
	public String getUniversityName() {
		return universityName;
	}
	/**
	 * @param universityName the universityName to set
	 */
	public void setUniversityName(String universityName) {
		this.universityName = universityName;
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
	 * @return the postedDateTime
	 */
	public Date getPostedDateTime() {
		return postedDateTime;
	}
	/**
	 * @param postedDateTime the postedDateTime to set
	 */
	public void setPostedDateTime(Date postedDateTime) {
		this.postedDateTime = postedDateTime;
	}
	/**
	 * @return the expired
	 */
	public boolean isExpired() {
		return expired;
	}
	/**
	 * @param expired the expired to set
	 */
	public void setExpired(boolean expired) {
		this.expired = expired;
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
	

}
