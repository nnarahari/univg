/**
 * 
 */
package com.ug.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Transactional;

import com.ug.dao.StudentGrantDAO;
import com.ug.exception.DBConnectionFailureException;
import com.ug.model.StudentGrant;

/**
 * @author srrajend
 *
 */
public class StudentGrantDAOImpl implements StudentGrantDAO {

	private Logger logger = Logger.getLogger(StudentGrantDAOImpl.class);
	
	private EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	
	/* (non-Javadoc)
	 * @see com.ug.dao.StudentGrantDAO#addNewGrant(com.ug.model.StudentGrant)
	 */
	@Override @Transactional
	public StudentGrant addNewGrant(StudentGrant studentGrant) throws Exception {
		logger.info("addNewGrant() started...");
		try{
			StudentGrant sGrant = entityManager.merge(studentGrant);
			return sGrant;
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
		return null;
	}

	/* (non-Javadoc)
	 * @see com.ug.dao.StudentGrantDAO#getAllGrants(java.lang.String)
	 */
	@Override
	public List<StudentGrant> getAllGrants(String studentEmail)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
