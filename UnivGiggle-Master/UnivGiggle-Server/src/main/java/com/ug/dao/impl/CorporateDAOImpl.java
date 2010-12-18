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

import com.ug.dao.CorporateDAO;
import com.ug.exception.DBConnectionFailureException;
import com.ug.model.Corporate;
import com.ug.model.Student;
import com.ug.model.StudentGrant;

/**
 * @author srrajend
 *
 */
public class CorporateDAOImpl implements CorporateDAO {
	
	private Logger logger = Logger.getLogger(CorporateDAOImpl.class);
	
	private EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	/* (non-Javadoc)
	 * @see com.ug.dao.CorporateDAO#createOrUpdateCorporate(com.ug.model.Corporate)
	 */
	@Override
	public Corporate createOrUpdateCorporate(Corporate corporate)throws Exception {
		logger.info("createOrUpdateCorporate() started...");
		try{
			Corporate newCorporate = entityManager.merge(corporate);
			logger.info("Corporate id ==>"+ newCorporate.getId());
			return newCorporate;
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

	@Override
	public Corporate getCorporate(String email) throws Exception {
		logger.info("getCorporate() started...email ==>"+ email);
		Corporate corporate = null;
		String qry = "Select Object(s) from Corporate c where c.email = :email";
		Query query = entityManager.createQuery(qry);
		query.setParameter("email", email); 
		try{
			corporate = (Corporate) query.getSingleResult();
		}catch(Exception e){
			logger.error("Error while reteriving corporate",e);
			throw e;
		}
		return corporate;
	}

}
