package com.ug.web;

import com.ug.domain.Pagesection;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "pagesections", formBackingObject = Pagesection.class)
@RequestMapping("/pagesections")
@Controller
public class PagesectionController {
}
