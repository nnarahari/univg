package com.ug.web;

import com.ug.domain.Address;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "addresses", formBackingObject = Address.class)
@RequestMapping("/addresses")
@Controller
public class AddressController {
}
