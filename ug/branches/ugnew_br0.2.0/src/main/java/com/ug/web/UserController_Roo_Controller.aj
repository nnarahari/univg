// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Address;
import com.ug.domain.Corporate;
import com.ug.domain.Guarantor;
import com.ug.domain.Loan;
import com.ug.domain.Profile;
import com.ug.domain.User;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
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

privileged aspect UserController_Roo_Controller {
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String UserController.createForm(Model uiModel) {
        uiModel.addAttribute("user", new User());
        addDateTimeFormatPatterns(uiModel);
        return "users/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String UserController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("user", User.findUser(id));
        uiModel.addAttribute("itemId", id);
        return "users/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String UserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("users", User.findUserEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) User.countUsers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("users", User.findAllUsers());
        }
        addDateTimeFormatPatterns(uiModel);
        return "users/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UserController.update(@Valid User user, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("user", user);
            addDateTimeFormatPatterns(uiModel);
            return "users/update";
        }
        uiModel.asMap().clear();
        user.merge();
        return "redirect:/users/" + encodeUrlPathSegment(user.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String UserController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("user", User.findUser(id));
        addDateTimeFormatPatterns(uiModel);
        return "users/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String UserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        User.findUser(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/users";
    }
    
    @RequestMapping(params = { "find=ByActivationKeyAndEmailAddress", "form" }, method = RequestMethod.GET)
    public String UserController.findUsersByActivationKeyAndEmailAddressForm(Model uiModel) {
        return "users/findUsersByActivationKeyAndEmailAddress";
    }
    
    @RequestMapping(params = "find=ByActivationKeyAndEmailAddress", method = RequestMethod.GET)
    public String UserController.findUsersByActivationKeyAndEmailAddress(@RequestParam("activationKey") String activationKey, @RequestParam("emailAddress") String emailAddress, Model uiModel) {
        uiModel.addAttribute("users", User.findUsersByActivationKeyAndEmailAddress(activationKey, emailAddress).getResultList());
        return "users/list";
    }
    
    @RequestMapping(params = { "find=ByEmailAddress", "form" }, method = RequestMethod.GET)
    public String UserController.findUsersByEmailAddressForm(Model uiModel) {
        return "users/findUsersByEmailAddress";
    }
    
    @RequestMapping(params = "find=ByEmailAddress", method = RequestMethod.GET)
    public String UserController.findUsersByEmailAddress(@RequestParam("emailAddress") String emailAddress, Model uiModel) {
        uiModel.addAttribute("users", User.findUsersByEmailAddress(emailAddress).getResultList());
        return "users/list";
    }
    
    @ModelAttribute("addresses")
    public Collection<Address> UserController.populateAddresses() {
        return Address.findAllAddresses();
    }
    
    @ModelAttribute("corporates")
    public java.util.Collection<Corporate> UserController.populateCorporates() {
        return Corporate.findAllCorporates();
    }
    
    @ModelAttribute("guarantors")
    public java.util.Collection<Guarantor> UserController.populateGuarantors() {
        return Guarantor.findAllGuarantors();
    }
    
    @ModelAttribute("loans")
    public java.util.Collection<Loan> UserController.populateLoans() {
        return Loan.findAllLoans();
    }
    
    @ModelAttribute("profiles")
    public java.util.Collection<Profile> UserController.populateProfiles() {
        return Profile.findAllProfiles();
    }
    
    @ModelAttribute("users")
    public java.util.Collection<User> UserController.populateUsers() {
        return User.findAllUsers();
    }
    
    void UserController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("user_activationdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    String UserController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
