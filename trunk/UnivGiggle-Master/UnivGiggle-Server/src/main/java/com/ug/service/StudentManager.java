/**
 * 
 */
package com.ug.service;

import com.ug.model.ResultInfo;
import com.ug.model.Student;

/**
 * @author srrajend
 *
 */
public interface StudentManager {

	public ResultInfo addStudent(Student student, byte [] profilePic, byte [] resumeData) throws Exception;
	
	public Student getStudent(String email) throws Exception;
	
}
