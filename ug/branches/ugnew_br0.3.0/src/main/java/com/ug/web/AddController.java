package com.ug.web;

import com.ug.domain.Add;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "adds", formBackingObject = Add.class)
@RequestMapping("/adds")
@Controller
public class AddController {
}
