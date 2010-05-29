/**
 * 
 */
package com.ug.dao;

import com.ug.model.UG_User;

/**
 * @author srajen03
 *
 */
public interface UGUserDAO {
	public UG_User addUser(UG_User user) throws Exception;
	public boolean validateUser(String userName, String password)throws Exception;
	boolean updateUser(String emailId) throws Exception;
	public UG_User getUser(String emailId) throws Exception;
}
