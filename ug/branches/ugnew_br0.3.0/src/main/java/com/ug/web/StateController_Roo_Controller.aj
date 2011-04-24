// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Address;
import com.ug.domain.Corporate;
import com.ug.domain.Guarantor;
import com.ug.domain.State;
import com.ug.domain.University;
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

privileged aspect StateController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String StateController.create(@Valid State state, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("state", state);
            return "states/create";
        }
        uiModel.asMap().clear();
        state.persist();
        return "redirect:/states/" + encodeUrlPathSegment(state.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String StateController.createForm(Model uiModel) {
        uiModel.addAttribute("state", new State());
        return "states/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String StateController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("state", State.findState(id));
        uiModel.addAttribute("itemId", id);
        return "states/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String StateController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("states", State.findStateEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) State.countStates() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("states", State.findAllStates());
        }
        return "states/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String StateController.update(@Valid State state, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("state", state);
            return "states/update";
        }
        uiModel.asMap().clear();
        state.merge();
        return "redirect:/states/" + encodeUrlPathSegment(state.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String StateController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("state", State.findState(id));
        return "states/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String StateController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        State.findState(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/states";
    }
    
    @ModelAttribute("addresses")
    public Collection<Address> StateController.populateAddresses() {
        return Address.findAllAddresses();
    }
    
    @ModelAttribute("corporates")
    public java.util.Collection<Corporate> StateController.populateCorporates() {
        return Corporate.findAllCorporates();
    }
    
    @ModelAttribute("guarantors")
    public java.util.Collection<Guarantor> StateController.populateGuarantors() {
        return Guarantor.findAllGuarantors();
    }
    
    @ModelAttribute("states")
    public java.util.Collection<State> StateController.populateStates() {
        return State.findAllStates();
    }
    
    @ModelAttribute("universitys")
    public java.util.Collection<University> StateController.populateUniversitys() {
        return University.findAllUniversitys();
    }
    
    String StateController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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