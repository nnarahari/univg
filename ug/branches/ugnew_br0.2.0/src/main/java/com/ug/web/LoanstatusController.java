package com.ug.web;

import com.ug.domain.Loanstatus;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "loanstatuses", formBackingObject = Loanstatus.class)
@RequestMapping("/loanstatuses")
@Controller
public class LoanstatusController {
}
