/**
 * 
 */
package com.ug.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
	
	@RequestMapping ( value="/success.htm")
	public String loginSuccess(HttpServletRequest req, Model uiModel){
		logger.debug("loginSuccess ....");
		String displayPage = "loginmain.jsp";
		long userId = 0;
		String loggedInUserRole = UgUtil.getLoggedInUserRoleName();
		User user = UgUtil.getLoggedInUser();
		
		if(user != null){
			userId = user.getId();
		}else{
			logger.debug("user is null...");
			displayPage = "redirect:/loginmain.jsp";
		}
		if(loggedInUserRole != null){
			if(loggedInUserRole.equalsIgnoreCase("student")){
				uiModel.addAttribute("profile", Profile.findProfile(userId));
				uiModel.addAttribute("itemId", userId);
				displayPage = "profiles/show";
			}else if(loggedInUserRole.equalsIgnoreCase("coporate")){
				uiModel.addAttribute("corporate", Corporate.findCorporate(userId));
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
	
	
}
