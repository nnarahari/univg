package com.ug.web;

import com.ug.domain.University;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "universitys", formBackingObject = University.class)
@RequestMapping("/universitys")
@Controller
public class UniversityController {
}
