/**
 * 
 */
package com.ug.dao;

import com.ug.model.Corporate;

/**
 * @author srrajend
 *
 */
public interface CorporateDAO {
	
	public Corporate createOrUpdateCorporate(Corporate corporate) throws Exception;
	
	public Corporate getCorporate(String email) throws Exception;

	public boolean activateCorporate(String id) throws Exception;

	public Corporate getCorporateById(String corporateId)throws Exception;
	
	

}
