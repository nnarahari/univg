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

import com.ug.dao.UGUserDAO;
import com.ug.exception.DBConnectionFailureException;
import com.ug.model.UG_User;

/**
 * @author srajen03
 *
 */
public class UGUserDAOImpl implements UGUserDAO {

	private Logger logger = Logger.getLogger(UGUserDAOImpl.class);
	private EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		if(entityManager == null)
			logger.info("entity manager is null...");
		this.entityManager = entityManager;
	}

	/**
	 * Add a UG_User into the database.
	 */
	@Override
	@Transactional
	public UG_User addUser(UG_User user) throws Exception {
		logger.info("inside addUser()..");
		try{
			UG_User ugUser = entityManager.merge(user);
			logger.info("id ==>"+ ugUser.getId());
			return ugUser;
		}catch(Throwable t){
			if(t != null) {
				if(t instanceof PersistenceException) {
					String errorMsg = t.getMessage().toString();
					if(errorMsg.contains("JDBCConnectionException")) {
						throw new DBConnectionFailureException("Unable to execute the query.Please check the database server is up.");
					}
					throw new Exception(t);
				}
				throw new Exception(t);				
			}
		}
		return null;
	}

	/**
	 * Validate the UG_User during login process.
	 */
	@Override
	public boolean validateUser(String userName, String password) throws Exception {
		logger.info("inside validateUser()");
		logger.info("userName ==>"+ userName);
		boolean isSuccess = false;
		String qry = "Select Object(u) from UG_User u where u.userName = :username and u.password = :password";
		Query query = entityManager.createQuery(qry);
		query.setParameter("username", userName); 
		query.setParameter("password", password);

		try{
		   UG_User user = (UG_User) query.getSingleResult();
		   if(user != null)
			   isSuccess = true;
			   
		}catch(Exception e){
			logger.error("Error while reteriving validateUser",e);
			throw e;
		}
		return isSuccess;
	}

	/**
	 * Get the UG_User object based on given email id.
	 * @param emailId
	 * @return
	 * @throws Exception
	 */
	private UG_User getUser(String emailId) throws Exception{
		logger.info("inside getUser ..");
		logger.info("emailId ==>"+ emailId);
		UG_User user = null;
		String qry = "Select Object(u) from UG_User u where u.emailId = :emailId";
		Query query = entityManager.createQuery(qry);
		query.setParameter("emailId", emailId); 
		try{
			user = (UG_User) query.getSingleResult();
		}catch(Exception e){
			logger.error("Error while reteriving getUser",e);
			throw e;
		}

		return user;
	}
	

	/**
	 * Update the UG_User's activated status.
	 */
	@Override
	@Transactional
	public boolean updateUser(String emailId) throws Exception {
		logger.info("updateUser() started..emailId ==>"+emailId);
		boolean isUpdated = false;
		UG_User user = getUser(emailId);
		if(user != null){
			logger.info("Activated Status ==>"+ user.isActivated());
			user.setActivated(true);
			try{
				UG_User newUser = entityManager.merge(user);
				isUpdated = newUser.isActivated();
				logger.info("Activated status after update ==>"+ isUpdated);
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
		}
		return isUpdated;
	}
}
