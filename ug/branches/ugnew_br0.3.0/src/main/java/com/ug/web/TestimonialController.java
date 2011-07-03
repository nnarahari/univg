package com.ug.web;

import com.ug.domain.Testimonial;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "testimonials", formBackingObject = Testimonial.class)
@RequestMapping("/testimonials")
@Controller
public class TestimonialController {
}
