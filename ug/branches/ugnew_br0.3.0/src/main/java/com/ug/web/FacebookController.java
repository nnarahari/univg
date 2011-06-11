package com.ug.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
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
	private Logger logger = Logger.getLogger(FacebookController.class);
	
	@RequestMapping(value="auth.do")
	public ModelAndView authenticate(@FacebookCookieValue(required=false, value="access_token") String cookie, HttpServletRequest req){
		logger.debug("Auth Started... user" + req.getRemoteUser());
		logger.debug("req ==>"+ req);
		String value ="";
		if(cookie == null){
			logger.debug("cookie is null, getting accesstoken manually....");

			for(Cookie cook :req.getCookies())
			{
				value = cook.getValue();
				logger.debug(cook.getName()+ "==" + value);

				if(cook.getValue().contains("access_token")){
					cookie = value.substring(value.indexOf("=")+1, value.indexOf("&"));
					try {
						cookie = URLDecoder.decode(cookie, "UTF-8");
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					break;	
				}
			}
			logger.debug("decoded cookie ==>"+ cookie);

		}

		logger.debug("cookie ==>"+ cookie);
		FacebookApi facebook = new FacebookTemplate(cookie);
		ModelAndView mav = new ModelAndView("authenticated");
		System.out.println("FB Authentication success..." + facebook.userOperations().getUserProfile().getEmail());
		mav.addObject("picture", facebook.userOperations().getUserProfile().getId());
		mav.addObject("userProfile",facebook.userOperations().getUserProfile());
		return mav;
	}
}

