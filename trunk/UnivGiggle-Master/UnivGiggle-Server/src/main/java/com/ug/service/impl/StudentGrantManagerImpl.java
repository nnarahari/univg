/**
 * 
 */
package com.ug.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.ug.dao.StudentGrantDAO;
import com.ug.model.ResultInfo;
import com.ug.model.StudentGrant;
import com.ug.service.StudentGrantManager;
import com.ug.util.UnivGiggleUtil;

/**
 * @author srrajend
 *
 */
public class StudentGrantManagerImpl implements StudentGrantManager {

	private Logger logger = Logger.getLogger(StudentGrantManagerImpl.class);
	
	@Autowired
	private StudentGrantDAO studentGrantDAO;
	
	
	
	@Override
	public ResultInfo createStudentGrant(StudentGrant studentGrant)	throws Exception {
		logger.info("createStudentGrant() started...");
		ResultInfo resultInfo = null;
		StudentGrant studGrant = studentGrantDAO.addNewGrant(studentGrant);
		if (studGrant != null){
			logger.info("New grant added successfully grant id ==>"+ studGrant.getId());
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Student grant created successfully.", "0", "Student grant created successfully.", studGrant);
		}
		return resultInfo;
	}



	/**
	 * @param studentGrantDAO the studentGrantDAO to set
	 */
	public void setStudentGrantDAO(StudentGrantDAO studentGrantDAO) {
		this.studentGrantDAO = studentGrantDAO;
	}

}
