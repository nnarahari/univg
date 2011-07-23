package com.ug.web;

import com.ug.domain.Jobtype;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "jobtypes", formBackingObject = Jobtype.class)
@RequestMapping("/jobtypes")
@Controller
public class JobtypeController {
}
