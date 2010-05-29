/**
 * 
 */
package com.ug.service;

import java.util.List;

import com.ug.model.Classified;
import com.ug.model.ResultInfo;

/**
 * @author srajen03
 *
 */
public interface ClassifiedManager {
	
	public ResultInfo addClassified(Classified classified) throws Exception;
	
	public ResultInfo updateConfirmationStatus(String classifiedId) throws Exception;
	
	public List<Classified> getListClassifieds(String country, String state, String university, String searchText) throws Exception;
	

}
