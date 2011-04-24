// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Department;
import com.ug.domain.Profile;
import com.ug.domain.Programstudy;
import com.ug.domain.University;
import com.ug.domain.User;
import com.ug.domain.UserRole;
import com.ug.uil.UgUtil;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ProfileController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ProfileController.create(@Valid Profile profile, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("profile", profile);
            addDateTimeFormatPatterns(uiModel);
            return "profiles/create";
        }
        uiModel.asMap().clear();
        profile.persist();
        return "redirect:/profiles/" + encodeUrlPathSegment(profile.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ProfileController.createForm(Model uiModel) {
        uiModel.addAttribute("profile", new Profile());
        addDateTimeFormatPatterns(uiModel);
        return "profiles/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ProfileController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("profile", Profile.findProfile(id));
        uiModel.addAttribute("itemId", id);
        return "profiles/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ProfileController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("profiles", Profile.findProfileEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Profile.countProfiles() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("profiles", UgUtil.getProfiles());
        }
        addDateTimeFormatPatterns(uiModel);
        return "profiles/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ProfileController.update(@Valid Profile profile, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("profile", profile);
            addDateTimeFormatPatterns(uiModel);
            return "profiles/update";
        }
        uiModel.asMap().clear();
        profile.merge();
        return "redirect:/profiles/" + encodeUrlPathSegment(profile.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ProfileController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("profile", Profile.findProfile(id));
        addDateTimeFormatPatterns(uiModel);
        return "profiles/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ProfileController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Profile.findProfile(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/profiles";
    }
    
    @RequestMapping(params = { "find=ByUniversityId", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByUniversityIdForm(Model uiModel) {
        uiModel.addAttribute("universitys", University.findAllUniversitys());
        return "profiles/findProfilesByUniversityId";
    }
    
    @RequestMapping(params = "find=ByUniversityId", method = RequestMethod.GET)
    public String ProfileController.findProfilesByUniversityId(@RequestParam("universityId") University universityId, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByUniversityId(universityId).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByUserId", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByUserIdForm(Model uiModel) {
        uiModel.addAttribute("users", User.findAllUsers());
        return "profiles/findProfilesByUserId";
    }
    
    @RequestMapping(params = "find=ByUserId", method = RequestMethod.GET)
    public String ProfileController.findProfilesByUserId(@RequestParam("userId") User userId, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByUserId(userId).getResultList());
        return "profiles/list";
    }
    
    @ModelAttribute("departments")
    public Collection<Department> ProfileController.populateDepartments() {
        return Department.findAllDepartments();
    }
    
    @ModelAttribute("profiles")
    public java.util.Collection<Profile> ProfileController.populateProfiles() {
        return UgUtil.getProfiles();
    }
    
    @ModelAttribute("programstudys")
    public java.util.Collection<Programstudy> ProfileController.populateProgramstudys() {
        return Programstudy.findAllProgramstudys();
    }
    
    @ModelAttribute("universitys")
    public java.util.Collection<University> ProfileController.populateUniversitys() {
        return University.findAllUniversitys();
    }
    
    @ModelAttribute("users")
    public java.util.Collection<User> ProfileController.populateUsers() {
		UserRole userRole = UgUtil.getLoggedInUserRole();
		if (userRole != null
				&& "admin".equals(userRole.getRoleEntry().getRoleName())) {
			return User.findAllUsers();
		} else {
			java.util.List<User> users = new ArrayList<User>();
			users.add(UgUtil.getLoggedInUser());
			return users;
		}
    }
    
    void ProfileController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("profile_dateofbirth_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("profile_expectedgraduationdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    String ProfileController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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