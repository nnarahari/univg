package com.ug.web;

import org.springframework.social.facebook.api.FacebookApi;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.web.FacebookCookieValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FacebookController {
	/*@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView home() {
		return new ModelAndView("home");
	}*/
	
	@RequestMapping(value="auth.do")
	public ModelAndView authenticate(@FacebookCookieValue(required=false, value="access_token") String cookie){
		System.out.println("Auth Started...");
		
		if(cookie == null){
			return new ModelAndView("authfail");
		}
		
		FacebookApi facebook = new FacebookTemplate(cookie);
		ModelAndView mav = new ModelAndView("authenticated");
		System.out.println("FB Authentication success...");
		mav.addObject("picture", facebook.userOperations().getUserProfile().getId());
		mav.addObject("userProfile",facebook.userOperations().getUserProfile());
		return mav;
	}
}

