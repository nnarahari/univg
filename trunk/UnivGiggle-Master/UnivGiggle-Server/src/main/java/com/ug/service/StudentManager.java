/**
 * 
 */
package com.ug.service;

import com.ug.model.ResultInfo;
import com.ug.model.Student;
import com.ug.model.StudentGrant;

/**
 * @author srrajend
 *
 */
public interface StudentManager {

	public ResultInfo addStudent(Student student, byte [] profilePic, byte [] resumeData) throws Exception;
	
	public Student getStudent(String email) throws Exception;

	public boolean addStudentGrant(String email, StudentGrant sGrant) throws Exception;

	public Student updateStudent(Student stud) throws Exception;
	
}
