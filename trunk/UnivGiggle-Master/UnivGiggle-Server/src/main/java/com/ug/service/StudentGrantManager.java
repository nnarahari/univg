/**
 * 
 */
package com.ug.service;

import com.ug.model.ResultInfo;
import com.ug.model.StudentGrant;

/**
 * @author srrajend
 *
 */
public interface StudentGrantManager {
	
	public ResultInfo createStudentGrant(StudentGrant studentGrant) throws Exception;

}
