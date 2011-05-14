package com.ug.web;

import com.ug.domain.Grantneededfor;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "grantneededfors", formBackingObject = Grantneededfor.class)
@RequestMapping("/grantneededfors")
@Controller
public class GrantneededforController {
}
