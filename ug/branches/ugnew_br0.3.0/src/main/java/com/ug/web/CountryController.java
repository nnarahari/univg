package com.ug.web;

import com.ug.domain.Country;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "countrys", formBackingObject = Country.class)
@RequestMapping("/countrys")
@Controller
public class CountryController {
}
