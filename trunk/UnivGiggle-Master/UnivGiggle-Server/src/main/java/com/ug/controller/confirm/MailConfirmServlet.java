/**
 * 
 */
package com.ug.controller.confirm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ug.model.ResultInfo;
import com.ug.service.ClassifiedManager;
import com.ug.service.MenteeManager;
import com.ug.service.MentorManager;
import com.ug.service.UserManager;

/**
 * @author srajen03
 *
 */
public class MailConfirmServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3361030928725506078L;

	
	private Logger logger = Logger.getLogger(MailConfirmServlet.class);
	
	private ClassifiedManager classifiedManager;
	private UserManager userManager;
	private MenteeManager menteeManager;
	private MentorManager mentorManager;
	private ResultInfo resultInfo;
	
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MailConfirmServlet(){
		super();
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("inside MailConfirmServlet service()");
		String key = request.getParameter("key");
		String id  = request.getParameter("id");
		logger.info("key ==>"+ key  +", id ==>"+ id);
		if(key.equalsIgnoreCase("Classified")){
			try {
				classifiedManager = (ClassifiedManager) getServletContext().getAttribute("classifiedManager");
				resultInfo = classifiedManager.updateConfirmationStatus(id);
				if(resultInfo.isSuccess()){
					updateResponse(response,"Classified confirmed successfully!");
				}else{
					updateResponse(response,"Classified not updated!");
				}
			} catch (Exception e) {
				logger.error("Error while updating updateConfirmationStatus()", e);
			}
		}else if(key.equalsIgnoreCase("UGUser")){
			
			try {
				userManager = (UserManager) getServletContext().getAttribute("userManager");
				resultInfo = userManager.updateConfirmationStatus(id);
				if(resultInfo.isSuccess()){
					updateResponse(response,"User confirmed successfully!");
				}else{
					updateResponse(response,"User status not confirmed!");
				}
			} catch (Exception e) {
				logger.error("Error while updating UGUser.updateConfirmationStatus()..",e);
			}
		}else if(key.equalsIgnoreCase("Mentor")){
			try {
				mentorManager = (MentorManager) getServletContext().getAttribute("mentorManager");
				boolean mentorActivated = mentorManager.activateMentor(id);
				if(mentorActivated){
					updateResponse(response,"Mentor confirmed successfully!");
				}else{
					updateResponse(response,"Mentor status not confirmed!");
				}
			} catch (Exception e) {
				logger.error("Error while updating mentorManager.activateMentor()...",e);
			}
		}else if(key.equalsIgnoreCase("Mentee")){
			try {
				menteeManager = (MenteeManager) getServletContext().getAttribute("menteeManager");
				boolean menteeActivated = menteeManager.activateMentee(id);
				if(menteeActivated){
					updateResponse(response,"Mentee confirmed successfully!");
				}else{
					updateResponse(response,"Mentee status not confirmed!");
				}
			} catch (Exception e) {
				logger.error("Error while updating menteeManager.activateMentee()...",e);
			}
		}
		else{
			logger.info("No key matched...");
		}
		

	}

	private void updateResponse(HttpServletResponse response, String message) throws IOException{
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	/**
	 * @param classifiedManager the classifiedManager to set
	 */
	public void setClassifiedManager(ClassifiedManager classifiedManager) {
		this.classifiedManager = classifiedManager;
	}

	/**
	 * @param menteeManager the menteeManager to set
	 */
	public void setMenteeManager(MenteeManager menteeManager) {
		this.menteeManager = menteeManager;
	}

	/**
	 * @param mentorManager the mentorManager to set
	 */
	public void setMentorManager(MentorManager mentorManager) {
		this.mentorManager = mentorManager;
	}
}
