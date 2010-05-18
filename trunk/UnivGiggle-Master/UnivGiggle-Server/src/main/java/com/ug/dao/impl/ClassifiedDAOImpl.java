/**
 * 
 */
package com.ug.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Transactional;

import com.ug.dao.ClassifiedDAO;
import com.ug.exception.DBConnectionFailureException;
import com.ug.model.Classified;

/**
 * @author srini
 *
 */
public class ClassifiedDAOImpl implements ClassifiedDAO {

	Logger logger = Logger.getLogger(ClassifiedDAOImpl.class);
	
	private EntityManager entityManager;
	
	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		if(entityManager == null)
			logger.info("entity manager is null...");
		this.entityManager = entityManager;
	}
	 
	@Override
	@Transactional
	public Classified addClassified(Classified classified) throws Exception {
		logger.info("inside addClassified()..");
		try{
			logger.info("entityManager ==>"+ entityManager);
			Classified cfd = entityManager.merge(classified);
			logger.info("id ==>"+ cfd.getId());
			return cfd;
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
		public List<Classified> getAllClassified() {
			// TODO Auto-generated method stub
			return null;
		}


		@SuppressWarnings("unchecked")
		@Override
		public List<Classified> getClassifiedbyUniversity(String universityid) throws Exception {
			logger.info("inside getClassifiedbyUniversity()");
			logger.info("Universityid ==>"+ universityid);
			List<Classified> classifiedList = null;
			String qry = "Select Object(c) from Classified c where c.universityName = :name";
			Query query = entityManager.createQuery(qry);
			query.setParameter("name", universityid); 
			try{
			   classifiedList = query.getResultList();
			}catch(Exception e){
				logger.error("Error while reteriving classified",e);
				throw e;
			}
			logger.info("No of classified for the "+ universityid + " is ==>"+ classifiedList.size());
			return classifiedList;
		}
		
		
		


		@SuppressWarnings("unchecked")
		@Override
		public List<Classified> getClassifiedbyUser(String userid) throws Exception {
			logger.info("inside getClassifiedbyUser()");
			logger.info("UserID ==>"+ userid);
			List<Classified> classifiedList = null;
			String qry = "Select Object(c) from Classified c where c.userName = :name";
			Query query = entityManager.createQuery(qry);
			query.setParameter("name", userid); 
			try{
			   classifiedList = query.getResultList();
			}catch(Exception e){
				logger.error("Error while reteriving classified",e);
				throw e;
			}
			logger.info("No of classified for the "+ userid + " is ==>"+ classifiedList.size());
			return classifiedList;
		}


		@Override
		public boolean updateClassified(Classified classified) {
			// TODO Auto-generated method stub
			return false;
		}

		@Override
		@Transactional
		public boolean updateClassified(String classifiedId) throws Exception {
			logger.info("inside updateClassified()");
			logger.info("classifiedId ==>"+ classifiedId);
			boolean isUpdated = false;
			Classified classified = getClassified(classifiedId);
			if(classified != null){
				logger.info("Activated Status ==>"+ classified.isActivated());
				classified.setActivated(true);
				try{
					Classified newClassified = entityManager.merge(classified);
					if(newClassified != null){
						logger.info("Classified updated successfully! ==>" + newClassified.isActivated());
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
		
		/**
		 * Get the classified object from DB for given classified ID.
		 * @param classifiedId
		 * @return
		 * @throws Exception
		 */
		private Classified getClassified(String classifiedId)throws Exception{
			logger.info("inside getClassified()");
			logger.info("classifiedId ==>"+ classifiedId);
			Classified cfd = null;
			String qry = "Select Object(c) from Classified c where c.id = :classifiedId";
			Query query = entityManager.createQuery(qry);
			query.setParameter("classifiedId", new Long(classifiedId).longValue()); 
			try{
				cfd = (Classified)query.getSingleResult();
			}catch(Exception e){
				logger.error("Error while reteriving classified",e);
				throw e;
			}
			return cfd;
		}

}
