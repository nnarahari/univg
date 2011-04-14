// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Guarantor;
import com.ug.domain.University;
import com.ug.reference.Gender;
import com.ug.reference.State;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Arrays;
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

privileged aspect GuarantorController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String GuarantorController.create(@Valid Guarantor guarantor, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("guarantor", guarantor);
            return "guarantors/create";
        }
        uiModel.asMap().clear();
        guarantor.persist();
        return "redirect:/guarantors/" + encodeUrlPathSegment(guarantor.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String GuarantorController.createForm(Model uiModel) {
        uiModel.addAttribute("guarantor", new Guarantor());
        return "guarantors/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String GuarantorController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("guarantor", Guarantor.findGuarantor(id));
        uiModel.addAttribute("itemId", id);
        return "guarantors/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String GuarantorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("guarantors", Guarantor.findGuarantorEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Guarantor.countGuarantors() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("guarantors", Guarantor.findAllGuarantors());
        }
        return "guarantors/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String GuarantorController.update(@Valid Guarantor guarantor, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("guarantor", guarantor);
            return "guarantors/update";
        }
        uiModel.asMap().clear();
        guarantor.merge();
        return "redirect:/guarantors/" + encodeUrlPathSegment(guarantor.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String GuarantorController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("guarantor", Guarantor.findGuarantor(id));
        return "guarantors/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String GuarantorController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Guarantor.findGuarantor(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/guarantors";
    }
    
    @ModelAttribute("guarantors")
    public Collection<Guarantor> GuarantorController.populateGuarantors() {
        return Guarantor.findAllGuarantors();
    }
    
    @ModelAttribute("universitys")
    public java.util.Collection<University> GuarantorController.populateUniversitys() {
        return University.findAllUniversitys();
    }
    
    @ModelAttribute("genders")
    public java.util.Collection<Gender> GuarantorController.populateGenders() {
        return Arrays.asList(Gender.class.getEnumConstants());
    }
    
    @ModelAttribute("states")
    public java.util.Collection<State> GuarantorController.populateStates() {
        return Arrays.asList(State.class.getEnumConstants());
    }
    
    String GuarantorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
