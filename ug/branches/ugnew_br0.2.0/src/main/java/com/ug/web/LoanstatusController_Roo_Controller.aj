// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Loan;
import com.ug.domain.Loanstatus;
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

privileged aspect LoanstatusController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String LoanstatusController.create(@Valid Loanstatus loanstatus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("loanstatus", loanstatus);
            return "loanstatuses/create";
        }
        uiModel.asMap().clear();
        loanstatus.persist();
        return "redirect:/loanstatuses/" + encodeUrlPathSegment(loanstatus.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String LoanstatusController.createForm(Model uiModel) {
        uiModel.addAttribute("loanstatus", new Loanstatus());
        return "loanstatuses/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String LoanstatusController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("loanstatus", Loanstatus.findLoanstatus(id));
        uiModel.addAttribute("itemId", id);
        return "loanstatuses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String LoanstatusController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("loanstatuses", Loanstatus.findLoanstatusEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Loanstatus.countLoanstatuses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("loanstatuses", Loanstatus.findAllLoanstatuses());
        }
        return "loanstatuses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String LoanstatusController.update(@Valid Loanstatus loanstatus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("loanstatus", loanstatus);
            return "loanstatuses/update";
        }
        uiModel.asMap().clear();
        loanstatus.merge();
        return "redirect:/loanstatuses/" + encodeUrlPathSegment(loanstatus.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String LoanstatusController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("loanstatus", Loanstatus.findLoanstatus(id));
        return "loanstatuses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String LoanstatusController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Loanstatus.findLoanstatus(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/loanstatuses";
    }
    
    @ModelAttribute("loans")
    public Collection<Loan> LoanstatusController.populateLoans() {
        return Loan.findAllLoans();
    }
    
    @ModelAttribute("loanstatuses")
    public java.util.Collection<Loanstatus> LoanstatusController.populateLoanstatuses() {
        return Loanstatus.findAllLoanstatuses();
    }
    
    String LoanstatusController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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