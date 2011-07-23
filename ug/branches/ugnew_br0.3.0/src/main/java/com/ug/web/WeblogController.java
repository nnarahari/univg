package com.ug.web;

import com.ug.domain.Weblog;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "weblogs", formBackingObject = Weblog.class)
@RequestMapping("/weblogs")
@Controller
public class WeblogController {
}
