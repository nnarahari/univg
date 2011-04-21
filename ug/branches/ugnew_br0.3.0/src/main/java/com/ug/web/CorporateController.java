package com.ug.web;

import com.ug.domain.Corporate;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "corporates", formBackingObject = Corporate.class)
@RequestMapping("/corporates")
@Controller
public class CorporateController {
}
