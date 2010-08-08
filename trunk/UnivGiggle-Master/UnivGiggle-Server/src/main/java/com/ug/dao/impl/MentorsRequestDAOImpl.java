/**
 * 
 */
package com.ug.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Transactional;

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
	@Override @Transactional
	public boolean addMentorsRequest(MentorsRequest mentorsRequest) {
		logger.info("addMentorsRequest() started....");
		logger.info(mentorsRequest.getMenteeEmail() + "," + mentorsRequest.getMentorEmail());
		MentorsRequest newMentorsRequest = entityManager.merge(mentorsRequest);
		
		if(newMentorsRequest != null){
			logger.info("newMentorsRequest ==>"+ newMentorsRequest.getId());
			return true;
		}
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

	@Override
	public List<MentorsRequest> getRequestsForMentor(String mentorEmail) throws Exception {
		logger.info("getRequestsForMentor() started...mentorEmail " + mentorEmail);
		String qry = "Select Object(m) from MentorsRequest m where m.mentorEmail = :mentorEmail";
		Query query = entityManager.createQuery(qry);
		query.setParameter("mentorEmail", mentorEmail);
		
		List<MentorsRequest> mentorReqList = query.getResultList();
		
		return mentorReqList;
	}

}
