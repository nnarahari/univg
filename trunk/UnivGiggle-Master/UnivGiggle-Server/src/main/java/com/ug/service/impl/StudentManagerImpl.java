/**
 * 
 */
package com.ug.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;

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
	private VelocityEngine velocityEngine;
	private JavaMailSender mailSender;
	
	private String imageAppURL;
	private String imageWebURL;
	
	@Override
	public ResultInfo addStudent(Student student, byte [] profilePic, byte [] resumeData) throws Exception {
		logger.info("addStudent() started....");
		ResultInfo resultInfo = null;
		boolean isStudentAdded = false;
		Student stud = studentDAO.createStudent(student);
		if (stud != null){
			logger.info("student profile added successfully... need to store profile photo and resume...");
			FileOutputStream fos=null;
			boolean dataStoredSuccess = false;
			if( profilePic != null && resumeData != null){

				String profilePicturePath =  imageAppURL + File.separator + "StudentPhoto"+ File.separator + student.getId() + File.separator + student.getPicturePath();
				String resumePath =  imageAppURL + File.separator + "StudentProfile"+ File.separator + student.getId() + File.separator + student.getResumePath();
				try{
					logger.info("storing profile picture...");
					fos = new FileOutputStream(new File(profilePicturePath));
					fos.write(profilePic);
					fos.close();

					logger.info("storing profile data...");

					fos = new FileOutputStream(new File(resumePath));
					fos.write(resumeData);
					fos.close();
					dataStoredSuccess = true;
				}catch(FileNotFoundException ex){
					logger.error("Error while saving file....",ex);
					dataStoredSuccess = false;
				}catch(IOException ioEx){
					logger.error("Error while saving file....",ioEx);
					dataStoredSuccess = false;
				}
				if(dataStoredSuccess){
					profilePicturePath =  imageWebURL + File.separator + "StudentPhoto"+ File.separator + student.getId() + File.separator + student.getPicturePath();
					resumePath =  imageWebURL + File.separator + "StudentProfile"+ File.separator + student.getId() + File.separator + student.getResumePath();
					logger.info("updating student profile with new resume and profile pic path....");
					stud.setPicturePath(profilePicturePath);
					stud.setResumePath(resumePath);
					updateStudent(stud);
					isStudentAdded = true;
				}
			}

		}else{
			resultInfo = UnivGiggleUtil.createResultInfo(false, "Store student profile failed.", "101", "Store student profile failed.", null);
		}
		if(isStudentAdded){
			logger.debug("Student added successfully, sending confirmation mail....");
			sendConfirmationMail(stud);
			resultInfo = UnivGiggleUtil.createResultInfo(true, "Student profile created successfully.", "0", "Student profile created successfully.", stud);
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
	
	
	@Override
	public boolean activateStudent(String id) throws Exception {
		logger.debug("activateStudent() started...id ==>"+ id);
		return studentDAO.activateStudent(id);
	}

	private void sendConfirmationMail(final Student student){
		logger.info("inside sendConfirmationMail()");
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
               MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
               message.setTo(student.getEmail());
               message.setSubject("UnivGiggle Student Confirmation");
               Map model = new HashMap();
               model.put("student", student);
               String text = VelocityEngineUtils.mergeTemplateIntoString(
                  velocityEngine, "StudentConfirmation.vm", model);
               logger.info("Mail content :: \n" + text);
               message.setText(text, true);
            }
         };
         this.mailSender.send(preparator);
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

	/**
	 * @param velocityEngine the velocityEngine to set
	 */
	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}

	

	/**
	 * @param mailSender the mailSender to set
	 */
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

}
