// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.ug.domain.Department;
import com.ug.domain.Gender;
import com.ug.domain.Profile;
import com.ug.domain.Programstudy;
import com.ug.domain.Role;
import com.ug.domain.University;
import com.ug.domain.User;
import com.ug.domain.UserRole;
import com.ug.util.AuditLogger;
import com.ug.util.UgUtil;


privileged aspect ProfileController_Roo_Controller {
	
	private static Logger logger = Logger.getLogger(ProfileController_Roo_Controller.class);
	
	@InitBinder
    public void initBinder(WebDataBinder binder)
    {
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
    }

    
    @RequestMapping(method = RequestMethod.POST)
    public String ProfileController.create(@Valid Profile profile, BindingResult bindingResult, Model uiModel, @RequestParam("file") MultipartFile content,@RequestParam("resume") MultipartFile resumeContent,HttpServletRequest httpServletRequest) {
       
    	Date dob = profile.getDateOfBirth();
    	long noOfDaysDiff = UgUtil.noOfDaysPast(dob);
    	if(noOfDaysDiff/365 < 18){
    		System.out.println("DOB is lessthan 18 years old");
    		FieldError fieldErr = new FieldError("profile", "dateOfBirth", "Minimum 18 years should be completed to create student profile.");
        	bindingResult.addError(fieldErr);
    	}else{
    		System.out.println("DOB is greater than 18 years...");
    	}
    	
    	
    	if (bindingResult.hasErrors()) {
        	System.out.println("Binding Errors:"+ bindingResult.getAllErrors().toString());
            uiModel.addAttribute("profile", profile);
            addDateTimeFormatPatterns(uiModel);
            return "profiles/create";
        }

    	String photoIdentifier = saveProfileImage(content, httpServletRequest.getSession().getServletContext().getRealPath("/"),profile.getUserId().getId()+"");
		String resumeIdentifier = saveResume(resumeContent, httpServletRequest.getSession().getServletContext().getRealPath("/"),profile.getUserId().getId()+"");
						
		profile.setPhotoIdentifier(photoIdentifier);
    	profile.setResumeIdentifier(resumeIdentifier);

    	saveProfileImage(content, "/ug",profile.getUserId().getId()+"");
        saveResume(resumeContent, "/ug",profile.getUserId().getId()+"");
        System.out.println("Profile:"+profile.toString());
        
        uiModel.asMap().clear();
        profile.persist();
        
        System.out.println("profile crreated.. associating student role to the user..");
        UserRole userRole = new UserRole();
        
        User user = UgUtil.getLoggedInUser();
        System.out.println("user ==>"+ user);
        
        Role role = Role.findRole(2L);//2 is for student
        
        System.out.println("role ==>"+ role);
        userRole.setUserEntry(user);
        userRole.setRoleEntry(role);
        
        userRole.persist();       
        System.out.println( "Done");
        
        AuditLogger.log(httpServletRequest.getRemoteUser(), "Student Profile Created", null);
        
        return "redirect:/profiles/" + encodeUrlPathSegment(profile.getId().toString(), httpServletRequest);
    }
    
    private static String saveResume(MultipartFile content,  String realPath, String id) {
    	return UgUtil.createFile("resume",content, realPath,id);
		
	}

	private static String saveProfileImage(MultipartFile content, String realPath, String id) {
		
		return UgUtil.createFile("profile",content, realPath,id);
	}

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String ProfileController.createForm(Model uiModel) {
        uiModel.addAttribute("profile", new Profile());
        addDateTimeFormatPatterns(uiModel);
        return "profiles/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ProfileController.show(@PathVariable("id") Long id, Model uiModel, HttpServletRequest req) {

    	Profile requestedProfile = Profile.findProfile(id);
    	try{
    		User user = UgUtil.getLoggedInUser();
    		TypedQuery<Profile> query = Profile.findProfilesByUserId(user);	
    		Profile userProfile = query.getSingleResult();

    		if(userProfile.getUserId() == requestedProfile.getUserId()){
    			logger.debug("requested id matches logged in user's id...");
    			addDateTimeFormatPatterns(uiModel);
    			uiModel.addAttribute("profile",requestedProfile );
    			uiModel.addAttribute("itemId", id);
    		}else{
    			logger.debug("######## requested id not matches logged in user's id... returning loggedin users profile");
    			addDateTimeFormatPatterns(uiModel);
    			uiModel.addAttribute("profile",userProfile );
    			uiModel.addAttribute("itemId", userProfile.getUserId());
    		}

    	}catch(Exception ex){
    		logger.error("Error while displaying profile page...", ex);
    		return "profiles/error";
    	}
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
            uiModel.addAttribute("profiles", Profile.findAllProfiles());
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
    
    @ModelAttribute("genders")
    public java.util.Collection<Gender> ProfileController.populateGenders() {
        return Gender.findAllGenders();
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
    
    @RequestMapping(params = { "find=ByCitizenship", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByCitizenshipForm(Model uiModel) {
        return "profiles/findProfilesByCitizenship";
    }
    
    @RequestMapping(params = "find=ByCitizenship", method = RequestMethod.GET)
    public String ProfileController.findProfilesByCitizenship(@RequestParam("citizenship") String citizenship, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByCitizenship(citizenship).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByCitizenshipLike", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByCitizenshipLikeForm(Model uiModel) {
        return "profiles/findProfilesByCitizenshipLike";
    }
    
    @RequestMapping(params = "find=ByCitizenshipLike", method = RequestMethod.GET)
    public String ProfileController.findProfilesByCitizenshipLike(@RequestParam("citizenship") String citizenship, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByCitizenshipLike(citizenship).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByDateOfBirth", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByDateOfBirthForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "profiles/findProfilesByDateOfBirth";
    }
    
    @RequestMapping(params = "find=ByDateOfBirth", method = RequestMethod.GET)
    public String ProfileController.findProfilesByDateOfBirth(@RequestParam("dateOfBirth") @DateTimeFormat(style = "S-") Date dateOfBirth, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByDateOfBirth(dateOfBirth).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByDateOfBirthBetween", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByDateOfBirthBetweenForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "profiles/findProfilesByDateOfBirthBetween";
    }
    
    @RequestMapping(params = "find=ByDateOfBirthBetween", method = RequestMethod.GET)
    public String ProfileController.findProfilesByDateOfBirthBetween(@RequestParam("minDateOfBirth") @DateTimeFormat(style = "S-") Date minDateOfBirth, @RequestParam("maxDateOfBirth") @DateTimeFormat(style = "S-") Date maxDateOfBirth, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByDateOfBirthBetween(minDateOfBirth, maxDateOfBirth).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByDateOfBirthGreaterThan", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByDateOfBirthGreaterThanForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "profiles/findProfilesByDateOfBirthGreaterThan";
    }
    
    @RequestMapping(params = "find=ByDateOfBirthGreaterThan", method = RequestMethod.GET)
    public String ProfileController.findProfilesByDateOfBirthGreaterThan(@RequestParam("dateOfBirth") @DateTimeFormat(style = "S-") Date dateOfBirth, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByDateOfBirthGreaterThan(dateOfBirth).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByDateOfBirthLessThan", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByDateOfBirthLessThanForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "profiles/findProfilesByDateOfBirthLessThan";
    }
    
    @RequestMapping(params = "find=ByDateOfBirthLessThan", method = RequestMethod.GET)
    public String ProfileController.findProfilesByDateOfBirthLessThan(@RequestParam("dateOfBirth") @DateTimeFormat(style = "S-") Date dateOfBirth, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByDateOfBirthLessThan(dateOfBirth).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByDepartmentId", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByDepartmentIdForm(Model uiModel) {
        uiModel.addAttribute("departments", Department.findAllDepartments());
        return "profiles/findProfilesByDepartmentId";
    }
    
    @RequestMapping(params = "find=ByDepartmentId", method = RequestMethod.GET)
    public String ProfileController.findProfilesByDepartmentId(@RequestParam("departmentId") Department departmentId, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByDepartmentId(departmentId).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByExpectedGraduationDate", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByExpectedGraduationDateForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "profiles/findProfilesByExpectedGraduationDate";
    }
    
    @RequestMapping(params = "find=ByExpectedGraduationDate", method = RequestMethod.GET)
    public String ProfileController.findProfilesByExpectedGraduationDate(@RequestParam("expectedGraduationDate") @DateTimeFormat(style = "S-") Date expectedGraduationDate, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByExpectedGraduationDate(expectedGraduationDate).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByExpectedGraduationDateBetween", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByExpectedGraduationDateBetweenForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "profiles/findProfilesByExpectedGraduationDateBetween";
    }
    
    @RequestMapping(params = "find=ByExpectedGraduationDateBetween", method = RequestMethod.GET)
    public String ProfileController.findProfilesByExpectedGraduationDateBetween(@RequestParam("minExpectedGraduationDate") @DateTimeFormat(style = "S-") Date minExpectedGraduationDate, @RequestParam("maxExpectedGraduationDate") @DateTimeFormat(style = "S-") Date maxExpectedGraduationDate, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByExpectedGraduationDateBetween(minExpectedGraduationDate, maxExpectedGraduationDate).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByGenderId", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByGenderIdForm(Model uiModel) {
        uiModel.addAttribute("genders", Gender.findAllGenders());
        return "profiles/findProfilesByGenderId";
    }
    
    @RequestMapping(params = "find=ByGenderId", method = RequestMethod.GET)
    public String ProfileController.findProfilesByGenderId(@RequestParam("genderId") Gender genderId, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByGenderId(genderId).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByHomePhone", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByHomePhoneForm(Model uiModel) {
        return "profiles/findProfilesByHomePhone";
    }
    
    @RequestMapping(params = "find=ByHomePhone", method = RequestMethod.GET)
    public String ProfileController.findProfilesByHomePhone(@RequestParam("homePhone") String homePhone, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByHomePhone(homePhone).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByHomePhoneLike", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByHomePhoneLikeForm(Model uiModel) {
        return "profiles/findProfilesByHomePhoneLike";
    }
    
    @RequestMapping(params = "find=ByHomePhoneLike", method = RequestMethod.GET)
    public String ProfileController.findProfilesByHomePhoneLike(@RequestParam("homePhone") String homePhone, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByHomePhoneLike(homePhone).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByMobile", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByMobileForm(Model uiModel) {
        return "profiles/findProfilesByMobile";
    }
    
    @RequestMapping(params = "find=ByMobile", method = RequestMethod.GET)
    public String ProfileController.findProfilesByMobile(@RequestParam("mobile") String mobile, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByMobile(mobile).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByMobileLike", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByMobileLikeForm(Model uiModel) {
        return "profiles/findProfilesByMobileLike";
    }
    
    @RequestMapping(params = "find=ByMobileLike", method = RequestMethod.GET)
    public String ProfileController.findProfilesByMobileLike(@RequestParam("mobile") String mobile, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByMobileLike(mobile).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByMobileNotEquals", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByMobileNotEqualsForm(Model uiModel) {
        return "profiles/findProfilesByMobileNotEquals";
    }
    
    @RequestMapping(params = "find=ByMobileNotEquals", method = RequestMethod.GET)
    public String ProfileController.findProfilesByMobileNotEquals(@RequestParam("mobile") String mobile, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByMobileNotEquals(mobile).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByPhotoIdentifier", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByPhotoIdentifierForm(Model uiModel) {
        return "profiles/findProfilesByPhotoIdentifier";
    }
    
    @RequestMapping(params = "find=ByPhotoIdentifier", method = RequestMethod.GET)
    public String ProfileController.findProfilesByPhotoIdentifier(@RequestParam("photoIdentifier") String photoIdentifier, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByPhotoIdentifier(photoIdentifier).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByPhotoIdentifierLike", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByPhotoIdentifierLikeForm(Model uiModel) {
        return "profiles/findProfilesByPhotoIdentifierLike";
    }
    
    @RequestMapping(params = "find=ByPhotoIdentifierLike", method = RequestMethod.GET)
    public String ProfileController.findProfilesByPhotoIdentifierLike(@RequestParam("photoIdentifier") String photoIdentifier, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByPhotoIdentifierLike(photoIdentifier).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByProgramStudyId", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByProgramStudyIdForm(Model uiModel) {
        uiModel.addAttribute("programstudys", Programstudy.findAllProgramstudys());
        return "profiles/findProfilesByProgramStudyId";
    }
    
    @RequestMapping(params = "find=ByProgramStudyId", method = RequestMethod.GET)
    public String ProfileController.findProfilesByProgramStudyId(@RequestParam("programStudyId") Programstudy programStudyId, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByProgramStudyId(programStudyId).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByResumeIdentifier", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByResumeIdentifierForm(Model uiModel) {
        return "profiles/findProfilesByResumeIdentifier";
    }
    
    @RequestMapping(params = "find=ByResumeIdentifier", method = RequestMethod.GET)
    public String ProfileController.findProfilesByResumeIdentifier(@RequestParam("resumeIdentifier") String resumeIdentifier, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByResumeIdentifier(resumeIdentifier).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByResumeIdentifierLike", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByResumeIdentifierLikeForm(Model uiModel) {
        return "profiles/findProfilesByResumeIdentifierLike";
    }
    
    @RequestMapping(params = "find=ByResumeIdentifierLike", method = RequestMethod.GET)
    public String ProfileController.findProfilesByResumeIdentifierLike(@RequestParam("resumeIdentifier") String resumeIdentifier, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByResumeIdentifierLike(resumeIdentifier).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByUniversityEmail", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByUniversityEmailForm(Model uiModel) {
        return "profiles/findProfilesByUniversityEmail";
    }
    
    @RequestMapping(params = "find=ByUniversityEmail", method = RequestMethod.GET)
    public String ProfileController.findProfilesByUniversityEmail(@RequestParam("universityEmail") String universityEmail, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByUniversityEmail(universityEmail).getResultList());
        return "profiles/list";
    }
    
    @RequestMapping(params = { "find=ByUniversityEmailLike", "form" }, method = RequestMethod.GET)
    public String ProfileController.findProfilesByUniversityEmailLikeForm(Model uiModel) {
        return "profiles/findProfilesByUniversityEmailLike";
    }
    
    @RequestMapping(params = "find=ByUniversityEmailLike", method = RequestMethod.GET)
    public String ProfileController.findProfilesByUniversityEmailLike(@RequestParam("universityEmail") String universityEmail, Model uiModel) {
        uiModel.addAttribute("profiles", Profile.findProfilesByUniversityEmailLike(universityEmail).getResultList());
        return "profiles/list";
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
        uiModel.addAttribute("profile_dateofbirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("profile_minexpectedgraduationdate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("profile_expectedgraduationdate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("profile_maxexpectedgraduationdate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("profile_mindateofbirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("profile_maxdateofbirth_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
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
