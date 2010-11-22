/**
 * 
 */
package com.ug.dao;

import java.util.List;

import com.ug.model.StudentGrant;

/**
 * @author srrajend
 *
 */
public interface StudentGrantDAO {
	
	public StudentGrant addNewGrant(StudentGrant studentGrant) throws Exception;

	public List<StudentGrant> getAllGrants(String studentEmail) throws Exception;
	
	
}
