package com.ug.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.hibernate.annotations.Cascade;
import org.springframework.transaction.annotation.Transactional;

import com.ug.dao.MentorDAO;
import com.ug.exception.DBConnectionFailureException;
import com.ug.model.Mentor;
/**
 * 
 * @author Anil.J
 *
 */
public class MentorDAOImpl implements MentorDAO {

	Logger logger = Logger.getLogger(MentorDAOImpl.class);

	private EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		if (entityManager == null)
			logger.info("entity manager is null...");
		this.entityManager = entityManager;
	}

	@Override
	/**
	 * Returns all mentors from table;
	 */
	public List<Mentor> getAllMentors() throws Exception {
		logger.info("inside getAllMentors()");
		List<Mentor> mentorList = null;
		String qry = "Select Object(c) from Mentor c";
		Query query = entityManager.createQuery(qry);
		try {
			mentorList = query.getResultList();
		} catch (Exception e) {
			logger.error("Error while reteriving mentors", e);
			throw e;
		}
		return mentorList;
	}

	/**
	 * Add new mentor/modify existing mentor.
	 */
	@Override
	@Transactional
	public Mentor createOrUpdateMentor(Mentor mentor) throws Exception {
		logger.info("inside createOrUpdateMentor()..");
		try {
			logger.info("entityManager ==>" + entityManager);
			Mentor mergedMentor = entityManager.merge(mentor);
			logger.info("id ==>" + mergedMentor.getId());
			return mergedMentor;
		} catch (Throwable e) {
			if (e != null) {
				if (e instanceof PersistenceException) {
					String errorMsg = e.getMessage().toString();
					if (errorMsg.contains("JDBCConnectionException")) {
						throw new DBConnectionFailureException(
								"Unable to execute the query.Please check the database server is up.");
					}
					throw new Exception(e);
				}
				throw new Exception(e);
			}
		}
		return null;
	}

	
	/**
	 * Get the Mentor based on the email id passed.
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Mentor> getMentorsByEmail(String email) throws Exception {
		logger.info("inside getMentorsByEmail()");
		logger.info("email ==>" + email);
		List<Mentor> mentorList = null;
		String qry = "Select Object(c) from mentor c where c.email LIKE :email";
		Query query = entityManager.createQuery(qry);
		query.setParameter("email", email);
		try {
			mentorList = query.getResultList();
		} catch (Exception e) {
			logger.error("Error while reteriving classified", e);
			throw e;
		}
		logger.info("No of mentor for the " + email + " is ==>"
				+ mentorList.size());
		return mentorList;
	}

	/**
	 * Delete the passed mentor.
	 */
	@Override
	public void deleteMentor(Mentor mentor) throws Exception{
		try{
			Mentor mentorTobeDeleted = entityManager.find(Mentor.class, mentor.getId());
			entityManager.remove(mentorTobeDeleted);
		}catch(Exception e){
			logger.info("Error while deleting",e);
			e.printStackTrace();
			throw e;
		}

	}

}
