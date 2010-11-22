/**
 * 
 */
package com.ug.dao;

import com.ug.model.Student;
import com.ug.model.StudentGrant;

/**
 * @author srrajend
 *
 */
public interface StudentDAO {

	public Student createStudent(Student student) throws Exception;
	
	public Student getStudent(String email) throws Exception;

	boolean addStudentGrant(String email, StudentGrant sGrant) throws Exception;
	
	
	
	
}
