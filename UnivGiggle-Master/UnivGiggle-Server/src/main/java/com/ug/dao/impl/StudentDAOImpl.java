/**
 * 
 */
package com.ug.dao.impl;

import java.util.ArrayList;
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

	@Override
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
		return true;
		
	}

}
