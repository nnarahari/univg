/**
 * 
 */
package com.ug.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author srrajend
 *
 */
@Entity 
@Table (name="Corporate")
public class Corporate extends ModelBase {
	
	private static final long serialVersionUID = -6689890155089392897L;
	
	public Corporate(){
		
	}

	@Column(name="corporatename", length=200, nullable=false)
	private String corporateName;
	
	@Column(name="email", length=100, unique=true, nullable=false)
	private String email;
	
	@Column(name="state", length=100, nullable=false)
	private String state;
	
	@Column(name="country", length=100, nullable=false)
	private String country;
	
	@Column(name="industry", length=100)
	private String industry;
	
	@Column(name="companydetails", length=2000)
	private String companyDetails;
	
	@Column(name="youtubevideo", length=200)
	private String youtubeVideo;
	
	@Column(name="compnayimagepath", length=250)
	private String companyImagePath;
	
	@Column(name="companywebsite", length=100)
	private String companyWebsite;
	
	@Column(name="grantlist", length=200)
	private String grantList; //TODO change properly.,.
	
	
	@Column(name="corporatestory", length=2000)
	private String corporateStory;
	
	
	@Column (name="commitedAmount" , nullable=false)
	private double commitedAmount;
	
	@Column (name="availableAmount" , nullable=false)
	private double availableAmount;
	
	@Column (name="activated")
	private boolean activated;

	/**
	 * @return the corporateName
	 */
	public String getCorporateName() {
		return corporateName;
	}

	/**
	 * @param corporateName the corporateName to set
	 */
	public void setCorporateName(String corporateName) {
		this.corporateName = corporateName;
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
	 * @return the industry
	 */
	public String getIndustry() {
		return industry;
	}

	/**
	 * @param industry the industry to set
	 */
	public void setIndustry(String industry) {
		this.industry = industry;
	}

	/**
	 * @return the companyDetails
	 */
	public String getCompanyDetails() {
		return companyDetails;
	}

	/**
	 * @param companyDetails the companyDetails to set
	 */
	public void setCompanyDetails(String companyDetails) {
		this.companyDetails = companyDetails;
	}

	/**
	 * @return the youtubeVideo
	 */
	public String getYoutubeVideo() {
		return youtubeVideo;
	}

	/**
	 * @param youtubeVideo the youtubeVideo to set
	 */
	public void setYoutubeVideo(String youtubeVideo) {
		this.youtubeVideo = youtubeVideo;
	}

	/**
	 * @return the companyImagePath
	 */
	public String getCompanyImagePath() {
		return companyImagePath;
	}

	/**
	 * @param companyImagePath the companyImagePath to set
	 */
	public void setCompanyImagePath(String companyImagePath) {
		this.companyImagePath = companyImagePath;
	}

	/**
	 * @return the companyWebsite
	 */
	public String getCompanyWebsite() {
		return companyWebsite;
	}

	/**
	 * @param companyWebsite the companyWebsite to set
	 */
	public void setCompanyWebsite(String companyWebsite) {
		this.companyWebsite = companyWebsite;
	}

	/**
	 * @return the grantList
	 */
	public String getGrantList() {
		return grantList;
	}

	/**
	 * @param grantList the grantList to set
	 */
	public void setGrantList(String grantList) {
		this.grantList = grantList;
	}

	/**
	 * @return the corporateStory
	 */
	public String getCorporateStory() {
		return corporateStory;
	}

	/**
	 * @param corporateStory the corporateStory to set
	 */
	public void setCorporateStory(String corporateStory) {
		this.corporateStory = corporateStory;
	}
	
	
	/**
	 * @return the commitedAmount
	 */
	public double getCommitedAmount() {
		return commitedAmount;
	}


	/**
	 * @param grantAmount the commitedAmount to set
	 */
	public void setCommitedAmount(double commitedAmount) {
		this.commitedAmount = commitedAmount;
	}
	
	
	/**
	 * @return the availableAmount
	 */
	public double getAvailableAmount() {
		return availableAmount;
	}


	/**
	 * @param grantAmount the availableAmount to set
	 */
	public void setAvailableAmount(double availableAmount) {
		this.availableAmount = availableAmount;
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
