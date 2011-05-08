package com.ug.web;

import com.ug.domain.Loan;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

@RooWebScaffold(path = "loans", formBackingObject = Loan.class)
@RequestMapping("/loans")
@Controller
public class LoanController {
	@InitBinder
    public void initBinder(WebDataBinder binder)
    {
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
    }

}
