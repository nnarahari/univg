// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Department;
import com.ug.domain.Profile;
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

privileged aspect DepartmentController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String DepartmentController.create(@Valid Department department, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("department", department);
            return "departments/create";
        }
        uiModel.asMap().clear();
        department.persist();
        return "redirect:/departments/" + encodeUrlPathSegment(department.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String DepartmentController.createForm(Model uiModel) {
        uiModel.addAttribute("department", new Department());
        return "departments/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String DepartmentController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("department", Department.findDepartment(id));
        uiModel.addAttribute("itemId", id);
        return "departments/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String DepartmentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("departments", Department.findDepartmentEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Department.countDepartments() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("departments", Department.findAllDepartments());
        }
        return "departments/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String DepartmentController.update(@Valid Department department, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("department", department);
            return "departments/update";
        }
        uiModel.asMap().clear();
        department.merge();
        return "redirect:/departments/" + encodeUrlPathSegment(department.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String DepartmentController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("department", Department.findDepartment(id));
        return "departments/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String DepartmentController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Department.findDepartment(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/departments";
    }
    
    @ModelAttribute("departments")
    public Collection<Department> DepartmentController.populateDepartments() {
        return Department.findAllDepartments();
    }
    
    @ModelAttribute("profiles")
    public java.util.Collection<Profile> DepartmentController.populateProfiles() {
        return Profile.findAllProfiles();
    }
    
    String DepartmentController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
