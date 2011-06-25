package com.ug.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import javax.persistence.TypedQuery;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.MessageDigestPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.facebook.api.FacebookApi;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.web.FacebookCookieValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ug.domain.Corporate;
import com.ug.domain.Profile;
import com.ug.domain.User;
import com.ug.util.UgUtil;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FacebookController {
	private Logger logger = Logger.getLogger(FacebookController.class);
	
	@Autowired
	private MessageDigestPasswordEncoder messageDigestPasswordEncoder;
	
	
	@RequestMapping(value="auth.do")
	public String authenticate(@FacebookCookieValue(required=false, value="access_token") String cookie, HttpServletRequest req, Model uiModel){
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
		String userEmail = facebook.userOperations().getUserProfile().getUsername();
		
		//facebook.userOperations().getUserProfile().getUsername()
		System.out.println("FB Authentication success..." + userEmail );
		
		String displayPage = "";
		User targetUser = null;
		
		//req.setAttribute("picture", facebook.userOperations().getUserProfile().getId());
		Set<GrantedAuthority> authorities =new HashSet<GrantedAuthority>();
		
		try{
			TypedQuery<User> query = User.findUsersByEmailAddress(userEmail);
			targetUser = (User) query.getSingleResult();
		}catch(EmptyResultDataAccessException e){
			logger.debug("No user account match with facebook email.. creating user and redirecting to login page.....");
			
			Random random = new Random(System.currentTimeMillis());
            String activationKey = "activationKey:" + random.nextInt();

            User User = new User();
            User.setActivationDate(new Date());
            User.setEmailAddress(userEmail);
            User.setFirstName(facebook.userOperations().getUserProfile().getFirstName());
            User.setLastName(facebook.userOperations().getUserProfile().getLastName());
            User.setPassword(messageDigestPasswordEncoder.encodePassword("password123",null));
            User.setActivationKey(activationKey);
            User.setEnabled(true);
            User.setLocked(true);
            User.persist();
            logger.debug("User created...");
            
            setManulAuth(userEmail,authorities );
            
			displayPage = "redirect:/loginmain.jsp";
			return displayPage;
		}
		
		
		if(targetUser != null){
	        long userId = targetUser.getId();
	        logger.debug("userId ==>"+ userId);
	        setManulAuth(userEmail,authorities );
	        String userRole = UgUtil.getLoggedInUserRoleName();
	        logger.debug("userRole ==>"+ userRole);
	        
	        if(userRole != null){
				if(userRole.equalsIgnoreCase("student")){
					TypedQuery<Profile> query = Profile.findProfilesByUserId(targetUser);	
					Profile profile = query.getSingleResult();
					uiModel.addAttribute("profile", profile);
					uiModel.addAttribute("itemId", userId);
					GrantedAuthority ga = new GrantedAuthority() {
						@Override
						public String getAuthority() {
							return "student";
						}
					};
					authorities.add(ga);
					setManulAuth(userEmail,authorities );
					
					displayPage = "profiles/show";
				}else if(userRole.equalsIgnoreCase("corporate")){
					TypedQuery<Corporate> query = Corporate.findCorporatesByUserId(targetUser);	
					Corporate corporate = query.getSingleResult();
					uiModel.addAttribute("corporate", corporate);
					uiModel.addAttribute("itemId", userId);
					
					GrantedAuthority ga = new GrantedAuthority() {
						@Override
						public String getAuthority() {
							return "corporate";
						}
					};
					authorities.add(ga);
					setManulAuth(userEmail,authorities );
					
					displayPage= "corporates/show";
				}else{
					setManulAuth(userEmail,authorities );
					displayPage = "redirect:/loginmain.jsp";
				}
			}else{
				logger.debug("No Roles associated with the user...");
				displayPage = "redirect:/loginmain.jsp";
			}
			logger.debug("displayPage ==>"+displayPage );
		}
		return displayPage;
	}
	
	
	private void setManulAuth(String userEmail, Set<GrantedAuthority> authorities){
		logger.debug("setting authentication....");
		org.springframework.security.core.userdetails.User user = new org.springframework.security.core.userdetails.User(userEmail, "fbpwd", true, true, true, true, authorities); 
		Authentication authentication = new UsernamePasswordAuthenticationToken(user, "password123", user.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
	}
	
}

