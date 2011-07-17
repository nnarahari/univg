package com.ug.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ug.domain.Mentor;

import org.apache.log4j.Logger;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RooWebScaffold(path = "mentors", formBackingObject = Mentor.class)
@RequestMapping("/mentors")
@Controller
public class MentorController {
	
	private Logger logger = Logger.getLogger(MentorController.class);
	
	@RequestMapping(value="/mentorForStudent",method=RequestMethod.GET)
	public String showMentros(HttpServletRequest req,HttpServletResponse res, Model uiModel){
		logger.debug("showMentros() started...");
		uiModel.addAttribute("mentors", null);
		return "mentors/mentorForStudent";
	}
}
