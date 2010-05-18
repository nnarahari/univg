/**
 * 
 */
package com.ug.service;

import com.ug.model.ResultInfo;
import com.ug.model.UG_User;

/**
 * @author srajen03
 *
 */
public interface UserManager {
	public boolean validateUser(String username, String password) throws Exception;
	public ResultInfo addUser(UG_User user) throws Exception;
	public ResultInfo updateConfirmationStatus(String id)throws Exception;

}
