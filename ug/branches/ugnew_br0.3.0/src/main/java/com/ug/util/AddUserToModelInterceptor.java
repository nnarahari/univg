package com.ug.util;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.servlet.ModelAndView;

public class AddUserToModelInterceptor implements MethodInterceptor {
	public Object invoke(MethodInvocation methodInvocation) throws Throwable {
		ModelAndView model = (ModelAndView) methodInvocation.proceed();
		if (model != null && getUser() != null) {
			model.addObject("user", getUser());
		}
		return model;
	}

	protected User getUser() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth != null && auth.getPrincipal() instanceof User) {
			return (User) auth.getPrincipal();
		} else {
			return null;
		}
	}
}