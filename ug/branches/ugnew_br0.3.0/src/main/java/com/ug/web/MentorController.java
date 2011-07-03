package com.ug.web;

import com.ug.domain.Mentor;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "mentors", formBackingObject = Mentor.class)
@RequestMapping("/mentors")
@Controller
public class MentorController {
}
