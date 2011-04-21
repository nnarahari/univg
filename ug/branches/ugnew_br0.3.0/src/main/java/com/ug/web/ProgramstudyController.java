package com.ug.web;

import com.ug.domain.Programstudy;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "programstudys", formBackingObject = Programstudy.class)
@RequestMapping("/programstudys")
@Controller
public class ProgramstudyController {
}
