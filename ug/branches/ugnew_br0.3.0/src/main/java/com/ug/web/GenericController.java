/**
 * 
 */
package com.ug.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author srrajend
 *
 */
@Controller
public class GenericController {
	
	private Logger logger = Logger.getLogger(GenericController.class);
	
	@RequestMapping(value="/mentBeforelogin")
	public String mentorBeforeLogin(HttpServletRequest req){
		logger.debug("mentorBeforeLogin() started...");
		return "mentBeforelogin";
	}
	
	@RequestMapping(value="/p2pBeforelogin")
	public String p2pBeforelogin(HttpServletRequest req){
		logger.debug("p2pBeforelogin() started...");
		return "p2pBeforelogin";
	}

}
