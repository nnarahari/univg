/**
 * 
 */
package com.ug.service;

import com.ug.model.Corporate;
import com.ug.model.ResultInfo;

/**
 * @author srrajend
 *
 */
public interface CorporateManager {
	
	public ResultInfo addCorporate(Corporate corporate) throws Exception;
	
	public Corporate getCorporate(String corpEmail) throws Exception;
	
	public ResultInfo updateCorporate(Corporate corporate) throws Exception;

}
