package com.ug.web;

import com.ug.domain.Profile;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

@RooWebScaffold(path = "profiles", formBackingObject = Profile.class)
@RequestMapping("/profiles")
@Controller
public class ProfileController {
	@InitBinder
    public void initBinder(WebDataBinder binder)
    {
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
    }

}
