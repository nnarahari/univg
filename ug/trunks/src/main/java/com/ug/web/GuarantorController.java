package com.ug.web;

import com.ug.domain.Guarantor;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "guarantors", formBackingObject = Guarantor.class)
@RequestMapping("/guarantors")
@Controller
public class GuarantorController {
}
