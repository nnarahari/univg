package com.ug.web;

import com.ug.domain.MentorMentee;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "mentormentees", formBackingObject = MentorMentee.class)
@RequestMapping("/mentormentees")
@Controller
public class MentorMenteeController {
}
