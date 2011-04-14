package com.ug.web;

import com.ug.domain.Role;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "roles", formBackingObject = Role.class)
@RequestMapping("/roles")
@Controller
public class RoleController {
}
