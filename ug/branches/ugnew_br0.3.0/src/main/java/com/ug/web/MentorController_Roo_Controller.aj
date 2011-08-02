// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Country;
import com.ug.domain.Gender;
import com.ug.domain.Mentor;
import com.ug.domain.Profession;
import com.ug.domain.Role;
import com.ug.domain.User;
import com.ug.domain.UserRole;
import com.ug.util.AuditLogger;
import com.ug.util.UgUtil;

import java.io.UnsupportedEncodingException;
import java.lang.Boolean;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MentorController_Roo_Controller {
    
	private Logger logger = Logger.getLogger(MentorController_Roo_Controller.class);
	
    @RequestMapping(method = RequestMethod.POST)
    public String MentorController.create(@Valid Mentor mentor, BindingResult bindingResult, Model uiModel, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("mentor", mentor);
            addDateTimeFormatPatterns(uiModel);
            return "mentors/create";
        }
        uiModel.asMap().clear();
        mentor.persist();
        /*****/
        
        System.out.println("Mentor crreated.. associating mentor role to the user..");
    	UserRole userRole = new UserRole();

    	User user = UgUtil.getLoggedInUser();
    	logger.debug("user ==>"+ user);

    	Role role = Role.findRole(4L);//4 is for Mentor

    	System.out.println("role ==>"+ role);
    	userRole.setUserEntry(user);
    	userRole.setRoleEntry(role);

    	userRole.persist();       
    	logger.debug( "Done");

    	AuditLogger.log(request.getRemoteUser(), "Mentor Profile Created", null);

    	//sendMailForUnivMailConfirmation(request, profile, user);

        return "redirect:/mentors/" + encodeUrlPathSegment(mentor.getId().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String MentorController.createForm(Model uiModel) {
        uiModel.addAttribute("mentor", new Mentor());
        addDateTimeFormatPatterns(uiModel);
        return "mentors/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String MentorController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("mentor", Mentor.findMentor(id));
        uiModel.addAttribute("itemId", id);
        return "mentors/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String MentorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("mentors", Mentor.findMentorEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Mentor.countMentors() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("mentors", Mentor.findAllMentors());
        }
        addDateTimeFormatPatterns(uiModel);
        return "mentors/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String MentorController.update(@Valid Mentor mentor, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("mentor", mentor);
            addDateTimeFormatPatterns(uiModel);
            return "mentors/update";
        }
        uiModel.asMap().clear();
        mentor.merge();
        return "redirect:/mentors/" + encodeUrlPathSegment(mentor.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String MentorController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("mentor", Mentor.findMentor(id));
        addDateTimeFormatPatterns(uiModel);
        return "mentors/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String MentorController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Mentor.findMentor(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/mentors";
    }
    
    @RequestMapping(params = { "find=ByCitizenship", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByCitizenshipForm(Model uiModel) {
        uiModel.addAttribute("countrys", Country.findAllCountrys());
        return "mentors/findMentorsByCitizenship";
    }
    
    @RequestMapping(params = "find=ByCitizenship", method = RequestMethod.GET)
    public String MentorController.findMentorsByCitizenship(@RequestParam("citizenship") Country citizenship, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByCitizenship(citizenship).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByCurrentProfession", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByCurrentProfessionForm(Model uiModel) {
        uiModel.addAttribute("professions", Profession.findAllProfessions());
        return "mentors/findMentorsByCurrentProfession";
    }
    
    @RequestMapping(params = "find=ByCurrentProfession", method = RequestMethod.GET)
    public String MentorController.findMentorsByCurrentProfession(@RequestParam("currentProfession") Profession currentProfession, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByCurrentProfession(currentProfession).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByDateOfBirth", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByDateOfBirthForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "mentors/findMentorsByDateOfBirth";
    }
    
    @RequestMapping(params = "find=ByDateOfBirth", method = RequestMethod.GET)
    public String MentorController.findMentorsByDateOfBirth(@RequestParam("dateOfBirth") @DateTimeFormat(style = "S-") Date dateOfBirth, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByDateOfBirth(dateOfBirth).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByDateOfBirthBetween", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByDateOfBirthBetweenForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "mentors/findMentorsByDateOfBirthBetween";
    }
    
    @RequestMapping(params = "find=ByDateOfBirthBetween", method = RequestMethod.GET)
    public String MentorController.findMentorsByDateOfBirthBetween(@RequestParam("minDateOfBirth") @DateTimeFormat(style = "S-") Date minDateOfBirth, @RequestParam("maxDateOfBirth") @DateTimeFormat(style = "S-") Date maxDateOfBirth, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByDateOfBirthBetween(minDateOfBirth, maxDateOfBirth).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByDateOfBirthGreaterThan", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByDateOfBirthGreaterThanForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "mentors/findMentorsByDateOfBirthGreaterThan";
    }
    
    @RequestMapping(params = "find=ByDateOfBirthGreaterThan", method = RequestMethod.GET)
    public String MentorController.findMentorsByDateOfBirthGreaterThan(@RequestParam("dateOfBirth") @DateTimeFormat(style = "S-") Date dateOfBirth, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByDateOfBirthGreaterThan(dateOfBirth).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByDateOfBirthLessThan", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByDateOfBirthLessThanForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "mentors/findMentorsByDateOfBirthLessThan";
    }
    
    @RequestMapping(params = "find=ByDateOfBirthLessThan", method = RequestMethod.GET)
    public String MentorController.findMentorsByDateOfBirthLessThan(@RequestParam("dateOfBirth") @DateTimeFormat(style = "S-") Date dateOfBirth, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByDateOfBirthLessThan(dateOfBirth).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByEnabled", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByEnabledForm(Model uiModel) {
        return "mentors/findMentorsByEnabled";
    }
    
    @RequestMapping(params = "find=ByEnabled", method = RequestMethod.GET)
    public String MentorController.findMentorsByEnabled(@RequestParam(value = "enabled", required = false) Boolean enabled, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByEnabled(enabled == null ? new Boolean(false) : enabled).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByEnabledNot", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByEnabledNotForm(Model uiModel) {
        return "mentors/findMentorsByEnabledNot";
    }
    
    @RequestMapping(params = "find=ByEnabledNot", method = RequestMethod.GET)
    public String MentorController.findMentorsByEnabledNot(@RequestParam(value = "enabled", required = false) Boolean enabled, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByEnabledNot(enabled == null ? new Boolean(false) : enabled).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByGenderId", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByGenderIdForm(Model uiModel) {
        uiModel.addAttribute("genders", Gender.findAllGenders());
        return "mentors/findMentorsByGenderId";
    }
    
    @RequestMapping(params = "find=ByGenderId", method = RequestMethod.GET)
    public String MentorController.findMentorsByGenderId(@RequestParam("genderId") Gender genderId, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByGenderId(genderId).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByHomePhone", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByHomePhoneForm(Model uiModel) {
        return "mentors/findMentorsByHomePhone";
    }
    
    @RequestMapping(params = "find=ByHomePhone", method = RequestMethod.GET)
    public String MentorController.findMentorsByHomePhone(@RequestParam("homePhone") String homePhone, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByHomePhone(homePhone).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByHomePhoneEquals", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByHomePhoneEqualsForm(Model uiModel) {
        return "mentors/findMentorsByHomePhoneEquals";
    }
    
    @RequestMapping(params = "find=ByHomePhoneEquals", method = RequestMethod.GET)
    public String MentorController.findMentorsByHomePhoneEquals(@RequestParam("homePhone") String homePhone, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByHomePhoneEquals(homePhone).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByHomePhoneLike", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByHomePhoneLikeForm(Model uiModel) {
        return "mentors/findMentorsByHomePhoneLike";
    }
    
    @RequestMapping(params = "find=ByHomePhoneLike", method = RequestMethod.GET)
    public String MentorController.findMentorsByHomePhoneLike(@RequestParam("homePhone") String homePhone, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByHomePhoneLike(homePhone).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByLoacked", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByLoackedForm(Model uiModel) {
        return "mentors/findMentorsByLoacked";
    }
    
    @RequestMapping(params = "find=ByLoacked", method = RequestMethod.GET)
    public String MentorController.findMentorsByLoacked(@RequestParam(value = "loacked", required = false) Boolean loacked, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByLoacked(loacked == null ? new Boolean(false) : loacked).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByLoackedNot", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByLoackedNotForm(Model uiModel) {
        return "mentors/findMentorsByLoackedNot";
    }
    
    @RequestMapping(params = "find=ByLoackedNot", method = RequestMethod.GET)
    public String MentorController.findMentorsByLoackedNot(@RequestParam(value = "loacked", required = false) Boolean loacked, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByLoackedNot(loacked == null ? new Boolean(false) : loacked).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByMobile", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByMobileForm(Model uiModel) {
        return "mentors/findMentorsByMobile";
    }
    
    @RequestMapping(params = "find=ByMobile", method = RequestMethod.GET)
    public String MentorController.findMentorsByMobile(@RequestParam("mobile") String mobile, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByMobile(mobile).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByMobileLike", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByMobileLikeForm(Model uiModel) {
        return "mentors/findMentorsByMobileLike";
    }
    
    @RequestMapping(params = "find=ByMobileLike", method = RequestMethod.GET)
    public String MentorController.findMentorsByMobileLike(@RequestParam("mobile") String mobile, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByMobileLike(mobile).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByOpenToAcceptMentee", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByOpenToAcceptMenteeForm(Model uiModel) {
        return "mentors/findMentorsByOpenToAcceptMentee";
    }
    
    @RequestMapping(params = "find=ByOpenToAcceptMentee", method = RequestMethod.GET)
    public String MentorController.findMentorsByOpenToAcceptMentee(@RequestParam(value = "openToAcceptMentee", required = false) Boolean openToAcceptMentee, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByOpenToAcceptMentee(openToAcceptMentee == null ? new Boolean(false) : openToAcceptMentee).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByOpenToAcceptMenteeNot", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByOpenToAcceptMenteeNotForm(Model uiModel) {
        return "mentors/findMentorsByOpenToAcceptMenteeNot";
    }
    
    @RequestMapping(params = "find=ByOpenToAcceptMenteeNot", method = RequestMethod.GET)
    public String MentorController.findMentorsByOpenToAcceptMenteeNot(@RequestParam(value = "openToAcceptMentee", required = false) Boolean openToAcceptMentee, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByOpenToAcceptMenteeNot(openToAcceptMentee == null ? new Boolean(false) : openToAcceptMentee).getResultList());
        return "mentors/list";
    }
    
    @RequestMapping(params = { "find=ByUserId", "form" }, method = RequestMethod.GET)
    public String MentorController.findMentorsByUserIdForm(Model uiModel) {
        uiModel.addAttribute("users", User.findAllUsers());
        return "mentors/findMentorsByUserId";
    }
    
    @RequestMapping(params = "find=ByUserId", method = RequestMethod.GET)
    public String MentorController.findMentorsByUserId(@RequestParam("userId") User userId, Model uiModel) {
        uiModel.addAttribute("mentors", Mentor.findMentorsByUserId(userId).getResultList());
        return "mentors/list";
    }
    
    @ModelAttribute("countrys")
    public Collection<Country> MentorController.populateCountrys() {
        return Country.findAllCountrys();
    }
    
    @ModelAttribute("genders")
    public java.util.Collection<Gender> MentorController.populateGenders() {
        return Gender.findAllGenders();
    }
    
    @ModelAttribute("mentors")
    public java.util.Collection<Mentor> MentorController.populateMentors() {
        return Mentor.findAllMentors();
    }
    
    @ModelAttribute("professions")
    public java.util.Collection<Profession> MentorController.populateProfessions() {
        return Profession.findAllProfessions();
    }
    
    @ModelAttribute("users")
    public java.util.Collection<User> MentorController.populateUsers() {
        return User.findAllUsers();
    }
    
    void MentorController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("mentor_dateofbirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("mentor_mindateofbirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("mentor_maxdateofbirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    String MentorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
