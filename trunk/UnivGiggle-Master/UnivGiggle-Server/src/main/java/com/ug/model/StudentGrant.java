/**
 * 
 */
package com.ug.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author srrajend
 *
 */
@Entity
@Table(name="StudentGrant")
public class StudentGrant extends ModelBase {
	
	private static final long serialVersionUID = 1300963282886234579L;

	@Column (name="grantamount" , nullable=false)
	private double grantAmount;
	
	@Column (name="requestedfor" , length=200, nullable=false)
	private String requestedFor;
	
	@Column (name="neededby", nullable=false)
	private String neededBy;
	
	@Column (name="requirement", nullable=false, length=2000)
	private String requirement;
	
	@Column (name="validationtemplatepath", nullable=false, length=200)
	private String validationTemplatePath;
	
	@Column (name="status", length=20, nullable=false)
	private String status;
	
	
	@ManyToOne
	private Student student;


	/**
	 * @return the grantAmount
	 */
	public double getGrantAmount() {
		return grantAmount;
	}


	/**
	 * @param grantAmount the grantAmount to set
	 */
	public void setGrantAmount(double grantAmount) {
		this.grantAmount = grantAmount;
	}


	/**
	 * @return the requestedFor
	 */
	public String getRequestedFor() {
		return requestedFor;
	}


	/**
	 * @param requestedFor the requestedFor to set
	 */
	public void setRequestedFor(String requestedFor) {
		this.requestedFor = requestedFor;
	}


	/**
	 * @return the neededBy
	 */
	public String getNeededBy() {
		return neededBy;
	}


	/**
	 * @param neededBy the neededBy to set
	 */
	public void setNeededBy(String neededBy) {
		this.neededBy = neededBy;
	}


	/**
	 * @return the requirement
	 */
	public String getRequirement() {
		return requirement;
	}


	/**
	 * @param requirement the requirement to set
	 */
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}


	/**
	 * @return the validationTemplatePath
	 */
	public String getValidationTemplatePath() {
		return validationTemplatePath;
	}


	/**
	 * @param validationTemplatePath the validationTemplatePath to set
	 */
	public void setValidationTemplatePath(String validationTemplatePath) {
		this.validationTemplatePath = validationTemplatePath;
	}


	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}


	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}


	/**
	 * @return the student
	 */
	public Student getStudent() {
		return student;
	}


	/**
	 * @param student the student to set
	 */
	public void setStudent(Student student) {
		this.student = student;
	}	

}
