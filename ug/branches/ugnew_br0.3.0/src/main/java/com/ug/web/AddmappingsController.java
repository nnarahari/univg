package com.ug.web;

import com.ug.domain.Addmappings;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "addmappingses", formBackingObject = Addmappings.class)
@RequestMapping("/addmappingses")
@Controller
public class AddmappingsController {
}
