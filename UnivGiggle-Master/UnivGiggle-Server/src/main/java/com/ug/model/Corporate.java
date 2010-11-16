/**
 * 
 */
package com.ug.model;

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

	private String corporateName;
	
	private String email;
	
	private String state;
	
	private String country;
	
	private String industry;
	
	private String companyDetails;
	
	private String youtubeVideo;
	
	private String companyImagePath;
	
	private String companyWebsite;
	
	private String grantList;
	
	private String corporateStory;

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
	

}
