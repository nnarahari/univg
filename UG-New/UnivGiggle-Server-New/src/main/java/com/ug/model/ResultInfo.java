/**
 * 
 */
package com.ug.model;

/**
 * @author srajen03
 *
 */
public class ResultInfo {

	private boolean success;
	private String responseDetail;
	private String responseCode;
	private String responseString;
	private Object responseObject;
	
	/**
	 * @return the success
	 */
	public boolean isSuccess() {
		return success;
	}
	/**
	 * @param success the success to set
	 */
	public void setSuccess(boolean success) {
		this.success = success;
	}
	/**
	 * @return the responseDetail
	 */
	public String getResponseDetail() {
		return responseDetail;
	}
	/**
	 * @param responseDetail the responseDetail to set
	 */
	public void setResponseDetail(String responseDetail) {
		this.responseDetail = responseDetail;
	}
	/**
	 * @return the responseCode
	 */
	public String getResponseCode() {
		return responseCode;
	}
	/**
	 * @param responseCode the responseCode to set
	 */
	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}
	/**
	 * @return the responseString
	 */
	public String getResponseString() {
		return responseString;
	}
	/**
	 * @param responseString the responseString to set
	 */
	public void setResponseString(String responseString) {
		this.responseString = responseString;
	}
	/**
	 * @return the responseObject
	 */
	public Object getResponseObject() {
		return responseObject;
	}
	/**
	 * @param responseObject the responseObject to set
	 */
	public void setResponseObject(Object responseObject) {
		this.responseObject = responseObject;
	}
	
	
}
