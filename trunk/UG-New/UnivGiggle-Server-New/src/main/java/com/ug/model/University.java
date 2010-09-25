/**
 * 
 */
package com.ug.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author srini
 *
 */
@Entity
@Table(name="University")
public class University extends ModelBase {

	private static final long serialVersionUID = -2583364563196502474L;

	@Column(name="country", nullable=false,length=50)
	private String country;
	
	@Column(name="state",nullable=false,length=50)
	private String state;
	
	@Column(name="universityname", unique=true, nullable=false, length=100)
	private String universityName;
	
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

}
