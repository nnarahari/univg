package com.ug.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Transactional;

import com.ug.dao.MentorDAO;
import com.ug.exception.DBConnectionFailureException;
import com.ug.model.Mentee;
import com.ug.model.Mentor;
import com.ug.model.Testimonial;

/**
 * @author srini
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

	@SuppressWarnings("unchecked")
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
	@Transactional
	public boolean deleteMentor(Mentor mentor) throws Exception {
		boolean isMenteeRemovalSuccess = false;
		try {
			Mentor mentorTobeDeleted = entityManager.find(Mentor.class, mentor
					.getId());
			if(null != mentorTobeDeleted){
				List<Mentee> dependantMenteeList = mentorTobeDeleted.getMenteeList();
				if(null != dependantMenteeList && dependantMenteeList.size()>0){
					for (Mentee menteeToDetach : dependantMenteeList) {
						detachMentee(mentor.getEmail(), menteeToDetach);
					}
				}
			}
			mentorTobeDeleted.setMenteeList(null);
			entityManager.remove(mentorTobeDeleted);
			isMenteeRemovalSuccess = true;
		} catch (Exception e) {
			logger.error("Error while deleting", e);
			throw e;
		}
		return isMenteeRemovalSuccess;
	}

	@Transactional
	@Override
	public boolean addMentee(String mentorEmail, Mentee mentee) {
		logger.info("addMentee() started..");
		logger.info("mentorEmail ==>" + mentorEmail);
		try {
			Mentor mentor = getMentor(mentorEmail);
			logger.info(mentor);
			logger.info("No of existing mentee for this mentor ==>"
					+ mentor.getMenteeList().size());
			List<Mentee> menteeList = mentor.getMenteeList();
			mentee.setMentor(mentor);
			menteeList.add(mentee);
			mentor.setMenteeList(menteeList);

			createOrUpdateMentor(mentor);
			return true;
		} catch (Exception e) {
			logger.error("Error while adding mentee to Mentor.", e);
		}
		return false;
	}

	@Transactional
	@Override
	public Mentor getMentor(String email) throws Exception {
		logger.info("getMentor() started...email ==>" + email);
		Mentor mentor = null;
		String qry = "Select Object(c) from Mentor c where c.email = :email";
		Query query = entityManager.createQuery(qry);
		query.setParameter("email", email);
		Mentor newMentorRef = new Mentor();
		try {
			mentor = (Mentor) query.getSingleResult();
			newMentorRef = mentor;
			List<Mentee> menteeList = new ArrayList<Mentee>();
			List<Testimonial> testimonialList = new ArrayList<Testimonial>();
			menteeList.addAll(mentor.getMenteeList());
			testimonialList.addAll(mentor.getTestmonialList());
			newMentorRef.setMenteeList(menteeList);
			newMentorRef.setTestmonialList(testimonialList);
		} catch (Exception e) {
			//logger.error("Error while reteriving Mentor", e);
			throw new Exception("No Mentor found!");
		}
		return newMentorRef;
	}

	@Transactional
	@Override
	public boolean detachMentee(String mentorEmail, Mentee mentee)
			throws Exception {
		logger.info("detachMentee() started...mentorEmail ==>" + mentorEmail);

		String qry = "update Mentee m set m.mentor=null where m.email = :email";
		Query query = entityManager.createQuery(qry);
		query.setParameter("email", mentee.getEmail());
		boolean isDetached = false;
		try {
			int noOfRowsUpdated = query.executeUpdate();
			if (noOfRowsUpdated > 0) {
				isDetached = true;
			}
		} catch (Exception e) {
			logger.error("Error while detaching mentee", e);
			throw e;
		}

		/*
		 * Mentor mentor = getMentor(mentorEmail); logger.info(mentor); List<Mentee>
		 * menteeList = mentor.getMenteeList(); menteeList = new ArrayList<Mentee>();
		 * mentee.setMentor(null); menteeList.add(mentee);
		 * mentor.setMenteeList(menteeList); try { createOrUpdateMentor(mentor);
		 * return true; } catch (Exception e) { logger.error("Error while
		 * removing mentee to Mentor.", e); }
		 */

		return isDetached;
	}

	@Override
	public boolean activateMentor(String mentorId) throws Exception {
		logger.info("inside activateMentee()...");
		logger.info("mentorId ==>"+ mentorId);
		boolean isUpdated = false;
		Mentor mentor = getMentorById(mentorId);
		if(mentor != null){
			logger.info("Activated Status ==>"+ mentor.isActivated());
			mentor.setActivated(true);
			try{
				Mentor newMentor = entityManager.merge(mentor);
				if(newMentor != null){
					logger.info("Mentor updated successfully! ==>" + newMentor.isActivated());
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

	@Override
	public Mentor getMentorById(String mentorId) {
		logger.info("getMentorById() started..");
		logger.info("mentorId ==>" + mentorId);
		Mentor mentor = null;
		try{
			Query query= entityManager.createQuery("Select Object(m) from Mentor m where m.id = :mentorId");
			query.setParameter("mentorId", mentorId);
			mentor = (Mentor) query.getSingleResult();
		}catch(Exception ex){
			logger.error("Error while querying Mentee's details.",ex);
		}
		return mentor;
	}

	@Override @Transactional
	public boolean addTestimonial(String mentorEmail, Testimonial testimonial) throws Exception {
		logger.info("addTestimonial() started...");
		logger.info("mentroEmail ==>" + mentorEmail);
		Mentor mentor = getMentor(mentorEmail);
		
		testimonial.setMentor(mentor);
		List<Testimonial>  testmonialList =  mentor.getTestmonialList();
		logger.info("testmonialList size ==>" + ((testmonialList != null)?testmonialList.size():"null") );
		testmonialList.add(testimonial);
		mentor.setTestmonialList(testmonialList);
		logger.info("adding tm to mentor...");
		Mentor newMentor = createOrUpdateMentor(mentor);
		if(newMentor != null){
			logger.info("tm size after adding ==>"+ newMentor.getTestmonialList().size());
			return true;
		}else{
			logger.error("Error while updating mentor...");
			return false;
		}
	}

	@Override @Transactional
	public List<Testimonial> getAllTestimonial(String mentorEmail) throws Exception{
		logger.info("getAllTestimonial() started...");
		logger.info("mentroEmail ==>" + mentorEmail);
		Mentor mentor = getMentor(mentorEmail);
		List<Testimonial>  testmonialList =  mentor.getTestmonialList();
		logger.info ("testmonialList size ==>" + testmonialList.size());
		return testmonialList;
	}

	@Override
	public List<Mentor> getMentors(String country, String profession)throws Exception {
		logger.info("getMentors() started... , country ==>"+ country + ", profession ==>"+ profession);
		List<Mentor> mentorList = null;
		String qry = "Select Object(c) from Mentor c where c.citizenship like :country and c.profession like :profession";
		Query query = entityManager.createQuery(qry);

		if(country != null && country.trim() != "")
			query.setParameter("country", country);
		else
			query.setParameter("country", "%");


		if(profession != null && profession.trim() != "")
			query.setParameter("profession", profession);
		else
			query.setParameter("profession", "%");

		try {
			mentorList = query.getResultList();
		} catch (Exception e) {
			logger.error("Error while reteriving mentors", e);
			throw e;
		}
		return mentorList;

	}

}
