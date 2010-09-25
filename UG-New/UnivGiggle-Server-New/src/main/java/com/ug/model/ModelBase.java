package com.ug.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Version;

@MappedSuperclass
public class ModelBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1435334432077702598L;

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Version
	@Column(name = "version")
	private int version;//Column

	@Column(name = "ISACTIVE")
	private Boolean isActive;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}


	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}


	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}
}
