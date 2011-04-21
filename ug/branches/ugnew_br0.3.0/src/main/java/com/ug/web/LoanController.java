package com.ug.web;

import com.ug.domain.Loan;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "loans", formBackingObject = Loan.class)
@RequestMapping("/loans")
@Controller
public class LoanController {
}
