// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Mentee;
import com.ug.domain.Mentor;
import com.ug.domain.Profession;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
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

privileged aspect ProfessionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ProfessionController.create(@Valid Profession profession, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("profession", profession);
            return "professions/create";
        }
        uiModel.asMap().clear();
        profession.persist();
        return "redirect:/professions/" + encodeUrlPathSegment(profession.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ProfessionController.createForm(Model uiModel) {
        uiModel.addAttribute("profession", new Profession());
        return "professions/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ProfessionController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("profession", Profession.findProfession(id));
        uiModel.addAttribute("itemId", id);
        return "professions/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ProfessionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("professions", Profession.findProfessionEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Profession.countProfessions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("professions", Profession.findAllProfessions());
        }
        return "professions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ProfessionController.update(@Valid Profession profession, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("profession", profession);
            return "professions/update";
        }
        uiModel.asMap().clear();
        profession.merge();
        return "redirect:/professions/" + encodeUrlPathSegment(profession.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ProfessionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("profession", Profession.findProfession(id));
        return "professions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ProfessionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Profession.findProfession(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/professions";
    }
    
    @ModelAttribute("mentees")
    public Collection<Mentee> ProfessionController.populateMentees() {
        return Mentee.findAllMentees();
    }
    
    @ModelAttribute("mentors")
    public java.util.Collection<Mentor> ProfessionController.populateMentors() {
        return Mentor.findAllMentors();
    }
    
    @ModelAttribute("professions")
    public java.util.Collection<Profession> ProfessionController.populateProfessions() {
        return Profession.findAllProfessions();
    }
    
    String ProfessionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
