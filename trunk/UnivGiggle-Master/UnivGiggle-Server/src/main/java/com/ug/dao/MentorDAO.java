package com.ug.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ug.exception.DBConnectionFailureException;
import com.ug.model.Mentor;
/**
 * 
 * @author Anil.J
 *
 */
public interface MentorDAO {
	@Transactional
	Mentor createOrUpdateMentor(Mentor mentor) throws Exception;

	List<Mentor> getAllMentors() throws Exception;

	List<Mentor> getMentorsByEmail(String email) throws Exception;

	void deleteMentor(Mentor mentor)  throws Exception;
}
