/**
 * 
 */
package com.ug.dao;

import java.util.List;

import com.ug.model.Student;
import com.ug.model.StudentGrant;

/**
 * @author srrajend
 *
 */
public interface StudentDAO {

	public Student createStudent(Student student) throws Exception;
	
	public Student getStudent(String email) throws Exception;

	public boolean addStudentGrant(String email, StudentGrant sGrant) throws Exception;

	public List<Student> getStudentsFromUniversity(String university) throws Exception;

	public boolean activateStudent(String id) throws Exception;

	public Student getStudentById(String studentId) throws Exception;
	
	
}
