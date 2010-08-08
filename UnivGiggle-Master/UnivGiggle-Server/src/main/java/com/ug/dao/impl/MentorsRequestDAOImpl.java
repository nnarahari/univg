/**
 * 
 */
package com.ug.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.log4j.Logger;

import com.ug.dao.MentorsRequestDAO;
import com.ug.model.MentorsRequest;

/**
 * @author srrajend
 *
 */
public class MentorsRequestDAOImpl implements MentorsRequestDAO {

	Logger logger = Logger.getLogger(MentorsRequestDAOImpl.class);

	private EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		if (entityManager == null)
			logger.info("entity manager is null...setting now..");
		this.entityManager = entityManager;
	}

	/* (non-Javadoc)
	 * @see com.ug.dao.MentorsRequestDAO#addMentorsRequest(com.ug.model.MentorsRequest)
	 */
	@Override
	public boolean addMentorsRequest(MentorsRequest mentorsRequest) {
		logger.info("addMentorsRequest() started....");
		MentorsRequest newMentorsRequest = entityManager.merge(mentorsRequest);
		logger.info("newMentorsRequest ==>"+ newMentorsRequest);
		if(newMentorsRequest != null)
			return true;
		else
			return false;
	}

	/* (non-Javadoc)
	 * @see com.ug.dao.MentorsRequestDAO#removeMentorsRequest(com.ug.model.MentorsRequest)
	 */
	@Override
	public boolean removeMentorsRequest(String mentorEmail, String menteeEmail) {
		logger.info("removeMentorsRequest() started...");
		logger.info("mentorEmail ==>"+ mentorEmail  + ", menteeEmail ==>"+ menteeEmail);

		String qry = "Delete from MentorsRequest m where m.mentorEmail = :mentorEmail and m.menteeEmail = :menteeEmail";
		Query query = entityManager.createQuery(qry);
		query.setParameter("mentorEmail", mentorEmail);
		query.setParameter("menteeEmail", menteeEmail);
		try{
			int count = query.executeUpdate();
			logger.info("deleted mentors request count ==>" + count);
		}catch (Exception e){
			logger.error("Error while deleting MentorsRequest ",e);
			return false;
		}
		return true;
	}

}
