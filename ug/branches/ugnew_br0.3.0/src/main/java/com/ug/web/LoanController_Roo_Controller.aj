// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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

import com.ug.domain.Address;
import com.ug.domain.Grantneededfor;
import com.ug.domain.Loan;
import com.ug.domain.Loanstatus;
import com.ug.domain.User;
import com.ug.domain.UserRole;
import com.ug.util.UgUtil;

privileged aspect LoanController_Roo_Controller {

	@InitBinder
    public void initBinder(WebDataBinder binder)
    {
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
    }

	@RequestMapping(method = RequestMethod.POST)
	public String LoanController.create(@Valid Loan loan,
			BindingResult bindingResult, Model uiModel,
			@RequestParam("vtemplate") MultipartFile content,
			HttpServletRequest httpServletRequest) {

		if (bindingResult.hasErrors()) {
			uiModel.addAttribute("loan", loan);
			addDateTimeFormatPatterns(uiModel);
			return "loans/create";
		}
		uiModel.asMap().clear();
		loan.persist();

		String fileName = saveValidationTemplate(content, httpServletRequest
				.getSession().getServletContext().getRealPath("/"), loan
				.getUserId().getId() + "-" + loan.getId());
		saveValidationTemplate(content, "/ug", loan.getUserId().getId() + "-"
				+ loan.getId());
		loan.setSupportDocumentName(fileName);
		loan.persist();
		return "redirect:/loans/"
				+ encodeUrlPathSegment(loan.getId().toString(),
						httpServletRequest);
	}

	@Autowired
	private static String saveValidationTemplate(MultipartFile content,
			String realPath, String templateFileName) {
		return UgUtil.createFile("loan", content, realPath, templateFileName);

	}

	@RequestMapping(params = "form", method = RequestMethod.GET)
    public String LoanController.createForm(Model uiModel) {
        uiModel.addAttribute("loan", new Loan());
        addDateTimeFormatPatterns(uiModel);
        return "loans/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String LoanController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("loan", Loan.findLoan(id));
        uiModel.addAttribute("itemId", id);
        return "loans/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String LoanController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("loans", Loan.findLoanEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Loan.countLoans() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("loans", com.ug.util.UgUtil.getLoans());
        }
        addDateTimeFormatPatterns(uiModel);
        return "loans/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String LoanController.update(@Valid Loan loan, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("loan", loan);
            addDateTimeFormatPatterns(uiModel);
            return "loans/update";
        }
        uiModel.asMap().clear();
        loan.merge();
        return "redirect:/loans/" + encodeUrlPathSegment(loan.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String LoanController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("loan", Loan.findLoan(id));
        addDateTimeFormatPatterns(uiModel);
        return "loans/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String LoanController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Loan.findLoan(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/loans";
    }
    
    @RequestMapping(params = { "find=ByLoanAmount", "form" }, method = RequestMethod.GET)
    public String LoanController.findLoansByLoanAmountForm(Model uiModel) {
        return "loans/findLoansByLoanAmount";
    }
    
    @RequestMapping(params = "find=ByLoanAmount", method = RequestMethod.GET)
    public String LoanController.findLoansByLoanAmount(@RequestParam("loanAmount") BigDecimal loanAmount, Model uiModel) {
        uiModel.addAttribute("loans", Loan.findLoansByLoanAmount(loanAmount).getResultList());
        return "loans/list";
    }
    
    @RequestMapping(params = { "find=ByLoanNeededBy", "form" }, method = RequestMethod.GET)
    public String LoanController.findLoansByLoanNeededByForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "loans/findLoansByLoanNeededBy";
    }
    
    @RequestMapping(params = "find=ByLoanNeededBy", method = RequestMethod.GET)
    public String LoanController.findLoansByLoanNeededBy(@RequestParam("loanNeededBy") @DateTimeFormat(style = "S-") Date loanNeededBy, Model uiModel) {
        uiModel.addAttribute("loans", Loan.findLoansByLoanNeededBy(loanNeededBy).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "loans/list";
    }
    
    @RequestMapping(params = { "find=ByLoanNeededByBetween", "form" }, method = RequestMethod.GET)
    public String LoanController.findLoansByLoanNeededByBetweenForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "loans/findLoansByLoanNeededByBetween";
    }
    
    @RequestMapping(params = "find=ByLoanNeededByBetween", method = RequestMethod.GET)
    public String LoanController.findLoansByLoanNeededByBetween(@RequestParam("minLoanNeededBy") @DateTimeFormat(style = "S-") Date minLoanNeededBy, @RequestParam("maxLoanNeededBy") @DateTimeFormat(style = "S-") Date maxLoanNeededBy, Model uiModel) {
        uiModel.addAttribute("loans", Loan.findLoansByLoanNeededByBetween(minLoanNeededBy, maxLoanNeededBy).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "loans/list";
    }
    
    @RequestMapping(params = { "find=ByLoanOriginDateBetween", "form" }, method = RequestMethod.GET)
    public String LoanController.findLoansByLoanOriginDateBetweenForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "loans/findLoansByLoanOriginDateBetween";
    }
    
    
    @RequestMapping(params = { "find=ByLoanStatusId", "form" }, method = RequestMethod.GET)
    public String LoanController.findLoansByLoanStatusIdForm(Model uiModel) {
        uiModel.addAttribute("loanstatuses", Loanstatus.findAllLoanstatuses());
        return "loans/findLoansByLoanStatusId";
    }
    
    @RequestMapping(params = "find=ByLoanStatusId", method = RequestMethod.GET)
    public String LoanController.findLoansByLoanStatusId(@RequestParam("loanStatusId") Loanstatus loanStatusId, Model uiModel) {
        uiModel.addAttribute("loans", Loan.findLoansByLoanStatusId(loanStatusId).getResultList());
        return "loans/list";
    }
    
    @RequestMapping(params = { "find=ByUserId", "form" }, method = RequestMethod.GET)
    public String LoanController.findLoansByUserIdForm(Model uiModel) {
        uiModel.addAttribute("users", User.findAllUsers());
        return "loans/findLoansByUserId";
    }
    
    @RequestMapping(params = "find=ByUserId", method = RequestMethod.GET)
    public String LoanController.findLoansByUserId(@RequestParam("userId") User userId, Model uiModel) {
        uiModel.addAttribute("loans", Loan.findLoansByUserId(userId).getResultList());
        return "loans/list";
    }
    
    @ModelAttribute("loans")
    public java.util.Collection<Loan> LoanController.populateLoans() {
    	return com.ug.util.UgUtil.getLoans();
    }
    
    @ModelAttribute("loanstatuses")
    public java.util.Collection<Loanstatus> LoanController.populateLoanstatuses() {
        return Loanstatus.findAllLoanstatuses();
    }
    
    @ModelAttribute("users")
    public java.util.Collection<User> LoanController.populateUsers() {
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
     
    @ModelAttribute("addresses")
    public Collection<Address> LoanController.populateAddresses() {
        return Address.findAllAddresses();
    }
      
    @ModelAttribute("grantneededfors")
    public Collection<Grantneededfor> LoanController.populateGrantneededfors() {
        return Grantneededfor.findAllGrantneededfors();
    }
      
    void LoanController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("loan_minloanorigindate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("loan_maxloanneededby_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("loan_lastpaymentdate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("loan_loanneededby_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("loan_minloanneededby_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("loan_firstpaymentdate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("loan_maxloanorigindate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("loan_loanorigindate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    String LoanController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
