package com.ug.web;

import com.ug.domain.Joblisting;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "joblistings", formBackingObject = Joblisting.class)
@RequestMapping("/joblistings")
@Controller
public class JoblistingController {
}
