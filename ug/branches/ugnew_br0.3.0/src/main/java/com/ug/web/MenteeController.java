package com.ug.web;

import com.ug.domain.Mentee;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "mentees", formBackingObject = Mentee.class)
@RequestMapping("/mentees")
@Controller
public class MenteeController {
}
