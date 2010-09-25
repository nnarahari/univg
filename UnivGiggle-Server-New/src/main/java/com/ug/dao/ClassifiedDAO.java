/**
 * 
 */
package com.ug.dao;

import java.util.List;

import com.ug.model.Classified;

/**
 * @author srini
 *
 */
public interface ClassifiedDAO {

	public Classified addClassified(Classified classified) throws Exception;
	
	public List<Classified> getAllClassified();
	
	public List<Classified> getClassifiedbyUser(String userid) throws Exception;
	
	public List<Classified> getClassifiedbyUniversity(String universityid) throws Exception;
	
	public boolean updateClassified(Classified classified);
	
	public boolean updateClassified(String classifiedId)throws Exception;
	
	public List<Classified> getAllClassifieds(String country, String state,
			String university, String searchText)throws Exception;
	
	public boolean updateClassifiedImagePath(String imagePath, String classifiedId) throws Exception;

	/**
	 * This method will return the {@link Classified} object if we pass the classified id.
	 * @param classifiedId
	 * @return
	 * @throws Exception 
	 */
	public Classified getClassified(String classifiedId) throws Exception;
	
}
