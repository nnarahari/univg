package com.ug.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ug.domain.Mentor;
import com.ug.domain.MentorMentee;
import com.ug.domain.Testimonial;
import com.ug.domain.User;
import com.ug.util.UgUtil;

@RooWebScaffold(path = "mentors", formBackingObject = Mentor.class)
@RequestMapping("/mentors")
@Controller
public class MentorController {
	
	private Logger logger = Logger.getLogger(MentorController.class);
	
	private final Long STUDENT_ROLE = 2L;
	
	@RequestMapping(value="/mentorStatusMessages",method=RequestMethod.GET)
	public String showStatusMessages(HttpServletRequest req,HttpServletResponse res, Model uiModel){
		logger.debug("showStatusMessages() started...");
		User user = UgUtil.getLoggedInUser();
		List<MentorMentee> mentorList = MentorMentee.findMentorMenteesByMentee(user.getId()).getResultList();
		
		uiModel.addAttribute("mentors", null);
		return "mentors/mentorStatusMessages";
	}
	
	@RequestMapping(value="/searchForMentor",method=RequestMethod.GET)
	public String searchForMentor(HttpServletRequest req,HttpServletResponse res, Model uiModel){
		logger.debug("searchForMentor() started...");
		List<MentorMentee> mentorList = MentorMentee.findAllMentors().getResultList();
		uiModel.addAttribute("mentorsList", mentorList);
		return "mentors/searchForMentor";
	}
	
	@RequestMapping(value="/showTestimonials",method=RequestMethod.GET)
	public String showTestimonials(HttpServletRequest req,HttpServletResponse res, Model uiModel){
		logger.debug("showTestimonials() started...");
		
		
		uiModel.addAttribute("mentors", null);
		return "mentors/showTestimonials";
	}
	
	@RequestMapping(value="/saveTestimonials",method=RequestMethod.POST)
	public String saveTestimonials(HttpServletRequest req,HttpServletResponse res, Model uiModel){
		logger.debug("saveTestimonials() started...");
		
		User user = UgUtil.getLoggedInUser();
		Testimonial testimonial = new Testimonial();
		testimonial.setDate(new Date());
		testimonial.setRole(STUDENT_ROLE);
		testimonial.setUserId(user.getId());
		//testimonial.set
		testimonial.persist();
		
		
		uiModel.addAttribute("Testimonial_Msg", "Testimonial added");
		return "mentors/showTestimonials";
	}
	
	@RequestMapping(value="/mentorshipHistory",method=RequestMethod.GET)
	public String showMentroshipHistory(HttpServletRequest req,HttpServletResponse res, Model uiModel){
		logger.debug("showMentroshipHistory() started...");
		User user = UgUtil.getLoggedInUser();
		List<MentorMentee> mentorList = MentorMentee.findMentorMenteesByMentee(user.getId()).getResultList();
		
		uiModel.addAttribute("mentorsList", mentorList);
		return "mentors/mentorshipHistory";
	}
	
	
	
	
}
