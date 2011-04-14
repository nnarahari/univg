package com.ug.web;

import com.ug.domain.State;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "states", formBackingObject = State.class)
@RequestMapping("/states")
@Controller
public class StateController {
}
