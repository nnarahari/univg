package com.ug.web;

import com.ug.domain.CorporateLoanAmount;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "corporateloanamounts", formBackingObject = CorporateLoanAmount.class)
@RequestMapping("/corporateloanamounts")
@Controller
public class CorporateLoanAmountController {
}
