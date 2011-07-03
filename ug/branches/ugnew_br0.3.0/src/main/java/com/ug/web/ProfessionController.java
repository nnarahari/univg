package com.ug.web;

import com.ug.domain.Profession;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "professions", formBackingObject = Profession.class)
@RequestMapping("/professions")
@Controller
public class ProfessionController {
}
