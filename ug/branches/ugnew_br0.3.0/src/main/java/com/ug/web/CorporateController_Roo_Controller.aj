// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Corporate;
import com.ug.domain.CorporateLoanAmount;
import com.ug.domain.State;
import com.ug.domain.User;
import com.ug.domain.UserRole;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CorporateController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String CorporateController.create(@Valid Corporate corporate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("corporate", corporate);
            return "corporates/create";
        }
        uiModel.asMap().clear();
        corporate.persist();
        return "redirect:/corporates/" + encodeUrlPathSegment(corporate.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String CorporateController.createForm(Model uiModel) {
        uiModel.addAttribute("corporate", new Corporate());
        return "corporates/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String CorporateController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("corporate", Corporate.findCorporate(id));
        uiModel.addAttribute("itemId", id);
        return "corporates/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String CorporateController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("corporates", Corporate.findCorporateEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Corporate.countCorporates() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("corporates", Corporate.findAllCorporates());
        }
        return "corporates/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CorporateController.update(@Valid Corporate corporate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("corporate", corporate);
            return "corporates/update";
        }
        uiModel.asMap().clear();
        corporate.merge();
        return "redirect:/corporates/" + encodeUrlPathSegment(corporate.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String CorporateController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("corporate", Corporate.findCorporate(id));
        return "corporates/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String CorporateController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Corporate.findCorporate(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/corporates";
    }
    
    @ModelAttribute("corporates")
    public Collection<Corporate> CorporateController.populateCorporates() {
        return Corporate.findAllCorporates();
    }
    
    @ModelAttribute("corporateloanamounts")
    public java.util.Collection<CorporateLoanAmount> CorporateController.populateCorporateLoanAmounts() {
        return CorporateLoanAmount.findAllCorporateLoanAmounts();
    }
    
    @ModelAttribute("states")
    public java.util.Collection<State> CorporateController.populateStates() {
        return State.findAllStates();
    }
    
    @ModelAttribute("users")
    public java.util.Collection<User> CorporateController.populateUsers() {
		UserRole userRole = com.ug.util.UgUtil.getLoggedInUserRole();
		if (userRole != null
				&& "admin".equals(userRole.getRoleEntry().getRoleName())) {
			return User.findAllUsers();
		} else {
			java.util.List<User> users = new ArrayList<User>();
			users.add(com.ug.util.UgUtil.getLoggedInUser());
			return users;
		}
    }
    
    String CorporateController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
