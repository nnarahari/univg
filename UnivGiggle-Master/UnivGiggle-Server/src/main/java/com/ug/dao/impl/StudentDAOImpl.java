/**
 * 
 */
package com.ug.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Transactional;

import com.ug.dao.StudentDAO;
import com.ug.exception.DBConnectionFailureException;
import com.ug.model.Student;
import com.ug.model.StudentGrant;


/**
 * @author srrajend
 *
 */
public class StudentDAOImpl implements StudentDAO {
	
	Logger logger = Logger.getLogger(StudentDAOImpl.class);


	private EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	

	@Override @Transactional
	public Student createStudent(Student student) throws Exception {
		logger.info("createStudent() started...");
		try{
			logger.info("entityManager ==>"+ entityManager);
			Student stud = entityManager.merge(student);
			logger.info("id ==>"+ stud.getId());
			return stud;
		}catch (Throwable e) {
			if(e != null) {
				if(e instanceof PersistenceException) {
					String errorMsg = e.getMessage().toString();
					if(errorMsg.contains("JDBCConnectionException")) {
						throw new DBConnectionFailureException("Unable to execute the query.Please check the database server is up.");
					}
					throw new Exception(e);
				}
				throw new Exception(e);				
			}
		}
		return null;
	}

	@Override @Transactional
	public Student getStudent(String email) throws Exception {
		logger.info("getStudent() started...");
		logger.info("email ==>"+ email);
		Student student = null;
		String qry = "Select Object(s) from Student s where s.email = :email";
		Query query = entityManager.createQuery(qry);
		query.setParameter("email", email); 
		
		Student newStudent = new Student();
		try{
			student = (Student) query.getSingleResult();
			newStudent = student;
			List<StudentGrant> sgList = new ArrayList<StudentGrant>();
			sgList.addAll(student.getGrantList());
			newStudent.setGrantList(sgList);
		}catch(Exception e){
			logger.error("Error while reteriving student",e);
			throw e;
		}
		return newStudent;
	}
	
	@Override @Transactional
	public boolean addStudentGrant(String email, StudentGrant sGrant)throws Exception{
		logger.info("addStudentGrant() started...email ==>"+ email);
		Student stud = getStudent(email);
		
		List<StudentGrant> sgList = stud.getGrantList();
		logger.info("studet grant size ==>"+ sgList.size());
		sGrant.setStudent(stud);
		sgList.add(sGrant);
		stud.setGrantList(sgList);
		
		Student newStud = createStudent(stud);
		if(newStud != null)
			return true;
		else
			return false;
		
	}


	@Override
	public List<Student> getStudentsFromUniversity(String university)throws Exception {
		logger.info("getStudentsFromUniversity() started...");
		List<Student> studentListToReturn = new ArrayList<Student>();
		String qry = "Select Object(s) from Student s where s.university = :university";
		Query query = entityManager.createQuery(qry);
		query.setParameter("university", university); 
		Student student = null;
		Student newStudent = new Student();
		try{
			List<Student> studentList =  query.getResultList();
			for (Iterator<Student> iterator = studentList.iterator(); iterator.hasNext();) {
				student =  iterator.next();
				newStudent = student;
				List<StudentGrant> sgList = new ArrayList<StudentGrant>();
				sgList.addAll(student.getGrantList());
				newStudent.setGrantList(sgList);
				studentListToReturn.add(newStudent);
			}
			return studentListToReturn;
		}catch(Exception e){
			logger.error("Error while reteriving student",e);
			throw e;
		}
	}

	@Override
	public Student getStudentById(String studentId){
		logger.debug("getStudentById() started.. id ==>"+ studentId);
		Student student = null;
		try{
			Query query= entityManager.createQuery("Select Object(s) from Student s where s.id = :studentId");
			query.setParameter("studentId", studentId);
			student = (Student) query.getSingleResult();
		}catch(Exception ex){
			logger.error("Error while querying Student details.",ex);
		}
		return student;
	}

	@Override
	public boolean activateStudent(String id) throws Exception {
		logger.debug("activateStudent() started... id ==>"+ id);
		boolean isUpdated = false;
		Student student = getStudentById(id);
		if(student != null){
			logger.info("Activated Status ==>"+ student.isActivated());
			student.setActivated(true);
			try{
				Student newStudent = entityManager.merge(student);
				if(newStudent != null){
					logger.info("Student updated successfully! ==>" + newStudent.isActivated());
					isUpdated = true;
				}
			}catch(Throwable e) {
				if(e != null) {
					if(e instanceof PersistenceException) {
						String errorMsg = e.getMessage().toString();
						if(errorMsg.contains("JDBCConnectionException")) {
							throw new DBConnectionFailureException("Unable to execute the query.Please check the database server is up.");
						}
						throw new Exception(e);
					}
					throw new Exception(e);				
				}
			}
		}
		return isUpdated;
	}
	

}
