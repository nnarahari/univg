/**
 * 
 */
package com.ug.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.ug.dao.StudentDAO;
import com.ug.model.ResultInfo;
import com.ug.model.Student;
import com.ug.model.StudentGrant;
import com.ug.service.StudentManager;
import com.ug.util.UnivGiggleUtil;

/**
 * @author srrajend
 *
 */
public class StudentManagerImpl implements StudentManager{
	
	private Logger logger = Logger.getLogger(StudentManagerImpl.class);
	
	@Autowired
	private StudentDAO studentDAO;
	
	private String imageAppURL;
	private String imageWebURL;
	
	@Override
	public ResultInfo addStudent(Student student, byte [] profilePic, byte [] resumeData) throws Exception {
		logger.info("addStudent() started....");
		ResultInfo resultInfo = null;
		Student stud = studentDAO.createStudent(student);
		if (stud != null){
			logger.info("student profile added successfully... need to store profile photo and resume...");
			if( profilePic != null && resumeData != null){
				//TODO store profile & resume..
			}
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Student profile created successfully.", "0", "Student profile created successfully.", stud);
		}else{
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Store student profile failed.", "101", "Store student profile failed.", null);
		}
		return resultInfo;
	}

	@Override
	public Student getStudent(String email) throws Exception {
		logger.info("getStudent() started...");
		return studentDAO.getStudent(email);
	}

	@Override
	public Student updateStudent(Student stud) throws Exception{
		return studentDAO.createStudent(stud);
	}
	
	@Override
	public boolean addStudentGrant(String email, StudentGrant sGrant)throws Exception{
		logger.info("addStudentGrant() started....");
		return studentDAO.addStudentGrant(email, sGrant);
	}
	
	/**
	 * @param studentDAO the studentDAO to set
	 */
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	/**
	 * @param imageAppURL the imageAppURL to set
	 */
	public void setImageAppURL(String imageAppURL) {
		this.imageAppURL = imageAppURL;
	}

	/**
	 * @param imageWebURL the imageWebURL to set
	 */
	public void setImageWebURL(String imageWebURL) {
		this.imageWebURL = imageWebURL;
	}

}
