package com.ug.web;

import com.ug.domain.Addtype;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "addtypes", formBackingObject = Addtype.class)
@RequestMapping("/addtypes")
@Controller
public class AddtypeController {
}
