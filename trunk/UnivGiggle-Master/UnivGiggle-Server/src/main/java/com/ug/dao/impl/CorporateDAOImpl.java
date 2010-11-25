/**
 * 
 */
package com.ug.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

import org.apache.log4j.Logger;

import com.ug.dao.CorporateDAO;
import com.ug.exception.DBConnectionFailureException;
import com.ug.model.Corporate;

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

}
