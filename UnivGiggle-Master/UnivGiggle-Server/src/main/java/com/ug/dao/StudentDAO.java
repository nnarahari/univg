/**
 * 
 */
package com.ug.dao;

import com.ug.model.Student;

/**
 * @author srrajend
 *
 */
public interface StudentDAO {

	public Student createStudent(Student student) throws Exception;
	
	public Student getStudent(String email) throws Exception;
	
	
}
