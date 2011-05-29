/**
 * 
 */
package com.ug.web;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ug.domain.Corporate;
import com.ug.domain.Profile;
import com.ug.domain.User;
import com.ug.util.UgUtil;

/**
 * @author srrajend
 *
 */  
@Controller
@RequestMapping (value="/login")
public class LoginController {
	
	private Logger logger = Logger.getLogger(LoginController.class);
	
	@RequestMapping ( value="/success")
	public String loginSuccess(HttpServletRequest req, Model uiModel){
		logger.debug("loginSuccess ....");
		String displayPage = "loginmain.jsp";
		long userId = 0;
		String loggedInUserRole = UgUtil.getLoggedInUserRoleName();
		User user = UgUtil.getLoggedInUser();
		
		logger.debug("loggedInUserRole ==>"+ loggedInUserRole);
		
		logger.debug("user ==>"+ user);
		
		if(user != null){
			userId = user.getId();
		}else{
			logger.debug("user is null...");
			displayPage = "redirect:/loginmain.jsp";
		}
		if(loggedInUserRole != null){
			if(loggedInUserRole.equalsIgnoreCase("student")){
				TypedQuery<Profile> query = Profile.findProfilesByUserId(user);	
				Profile profile = query.getSingleResult();
				uiModel.addAttribute("profile", profile);
				uiModel.addAttribute("itemId", userId);
				displayPage = "profiles/show";
			}else if(loggedInUserRole.equalsIgnoreCase("corporate")){
				TypedQuery<Corporate> query = Corporate.findCorporatesByUserId(user);	
				Corporate corporate = query.getSingleResult();
				uiModel.addAttribute("corporate", corporate);
				uiModel.addAttribute("itemId", userId);
				displayPage= "corporates/show";
			}else{
				displayPage = "redirect:/loginmain.jsp";
			}
		}else{
			logger.debug("No Roles associated with the user...");
			displayPage = "redirect:/loginmain.jsp";
		}
	
		logger.debug("displayPage ==>"+displayPage );
		return displayPage;
	}
	
	/*@RequestMapping ( value="/studentBefore.htm")
	public String studentBeforeLogin(HttpServletRequest req, Model uiModel){
		logger.debug("studentBeforeLogin() started...");
		String displayPage = "studentBeforelogin";
		return displayPage;
	}
	
	@RequestMapping ( value="/coporateBefore.htm")
	public String coporateBeforeLogin(HttpServletRequest req, Model uiModel){
		logger.debug("coporateBeforeLogin() started...");
		String displayPage = "corporateBeforelogin";
		return displayPage;
	}*/
	
}
