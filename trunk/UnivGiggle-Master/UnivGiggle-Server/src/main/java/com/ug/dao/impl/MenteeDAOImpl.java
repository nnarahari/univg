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

import com.ug.dao.MenteeeDAO;
import com.ug.exception.DBConnectionFailureException;
import com.ug.model.Classified;
import com.ug.model.Mentee;
import com.ug.model.Mentor;

/**
 * @author srini
 *
 */
public class MenteeDAOImpl implements MenteeeDAO {

	Logger logger = Logger.getLogger(MenteeDAOImpl.class);

	private EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		if (entityManager == null)
			logger.info("entity manager is null...setting now..");
		this.entityManager = entityManager;
	}


	/* (non-Javadoc)
	 * @see com.ug.dao.MenteeeDAO#addMentee(com.ug.model.Mentee)
	 */
	@Override
	@Transactional
	public Mentee addMentee(Mentee mentee) throws Exception {
		logger.info("addMentee started...");
		try{
			Mentee newMentee = entityManager.merge(mentee);
			return newMentee;
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

	/* (non-Javadoc)
	 * @see com.ug.dao.MenteeeDAO#updateMentor(java.lang.String, com.ug.model.Mentor)
	 */
	@Override
	public boolean updateMentor(String menteeEmail, Mentor mentor) {
		logger.info("updateMentor() started...");
		logger.info("menteeEmail ==>"+menteeEmail);
		boolean isMentorUpdated = false;
		try{
			Mentee mentee = getMentee(menteeEmail);
			mentee.setMentor(mentor);
			isMentorUpdated = updateMentee(mentee);
		}catch(Exception ex){
			logger.error("Error while updating mentor.",ex);
		}
		return isMentorUpdated;
	}


	@Override
	public boolean updateMentee(Mentee mentee) {
		logger.info("updateMentee() started...");
		Mentee newMentee = null;
		try{
			newMentee = entityManager.merge(mentee);
			logger.info("After update mentee id ==>" + newMentee.getId());
		}catch(Exception ex){
			logger.error("Error while updating Mentee.",ex);
		}
		return (newMentee != null) ;
	}


	@Override
	public Mentee getMentee(String email) {
		logger.info("getMentee() started..");
		logger.info("email ==>" + email);
		Mentee mentee = null;
		try{
			Query query= entityManager.createQuery("Select Object(m) from Mentee m where m.email = :email");
			query.setParameter("email", email);
			mentee = (Mentee) query.getSingleResult();
		}catch(Exception ex){
			logger.error("Error while querying Mentee's details.",ex);
		}
		return mentee;
	}
	
	@Override
	public Mentee getMenteeById(String menteeId) {
		logger.info("getMenteeById() started..");
		logger.info("menteeId ==>" + menteeId);
		Mentee mentee = null;
		try{
			Query query= entityManager.createQuery("Select Object(m) from Mentee m where m.id = :menteeId");
			query.setParameter("menteeId", menteeId);
			mentee = (Mentee) query.getSingleResult();
		}catch(Exception ex){
			logger.error("Error while querying Mentee's details.",ex);
		}
		return mentee;
	}

	@Override
	public boolean removeMentee(Mentee mentee) {
		logger.info("removeMentee() started...");
		try{
			entityManager.remove(mentee);
			return true;
		}catch(Exception ex){
			logger.error("Error while removing mentee...",ex);
			return false;
		}
		
	}
	@Override
	public List<Mentee> getAvailableMentees() throws Exception {
		logger.info("getAvailableMentees() started..");
		List<Mentee> menteeList = null;
		try{
			Query query= entityManager.createQuery("Select Object(m) from Mentee m where m.mentor is null");
			menteeList = query.getResultList();
		}catch(Exception ex){
			logger.error("Error while querying Available Mentee's details.",ex);
			throw ex;
		}
		return menteeList;
	}


	@Override
	public boolean activateMentee(String menteeId) throws Exception {
		logger.info("inside activateMentee()...");
		logger.info("menteeId ==>"+ menteeId);
		boolean isUpdated = false;
		Mentee mentee = getMenteeById(menteeId);
		if(mentee != null){
			logger.info("Activated Status ==>"+ mentee.isActivated());
			mentee.setActivated(true);
			try{
				Mentee newMentee = entityManager.merge(mentee);
				if(newMentee != null){
					logger.info("Mentee updated successfully! ==>" + newMentee.isActivated());
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
