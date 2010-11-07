/**
 * 
 */
package com.ug.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Transactional;

import com.ug.dao.StudentDAO;
import com.ug.exception.DBConnectionFailureException;
import com.ug.model.Classified;
import com.ug.model.Student;

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
		logger.debug("email ==>"+ email);
		Student student = null;
		String qry = "Select Object(c) from Student s where s.email = :email";
		Query query = entityManager.createQuery(qry);
		query.setParameter("email", email); 
		try{
			student = (Student) query.getSingleResult();
		}catch(Exception e){
			logger.error("Error while reteriving classified",e);
			throw e;
		}
		return student;
	}

}
