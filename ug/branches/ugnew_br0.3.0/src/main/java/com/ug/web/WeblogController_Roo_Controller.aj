// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ug.web;

import com.ug.domain.Weblog;
import com.ug.domain.WeblogPK;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect WeblogController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String WeblogController.create(@Valid Weblog weblog, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("weblog", weblog);
            return "weblogs/create";
        }
        uiModel.asMap().clear();
        weblog.persist();
        return "redirect:/weblogs/" + encodeUrlPathSegment(weblog.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String WeblogController.createForm(Model uiModel) {
        uiModel.addAttribute("weblog", new Weblog());
        return "weblogs/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String WeblogController.show(@PathVariable("id") WeblogPK id, Model uiModel) {
        uiModel.addAttribute("weblog", Weblog.findWeblog(id));
        uiModel.addAttribute("itemId", id);
        return "weblogs/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String WeblogController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("weblogs", Weblog.findWeblogEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Weblog.countWeblogs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("weblogs", Weblog.findAllWeblogs());
        }
        return "weblogs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String WeblogController.update(@Valid Weblog weblog, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("weblog", weblog);
            return "weblogs/update";
        }
        uiModel.asMap().clear();
        weblog.merge();
        return "redirect:/weblogs/" + encodeUrlPathSegment(weblog.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String WeblogController.updateForm(@PathVariable("id") WeblogPK id, Model uiModel) {
        uiModel.addAttribute("weblog", Weblog.findWeblog(id));
        return "weblogs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String WeblogController.delete(@PathVariable("id") WeblogPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Weblog.findWeblog(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/weblogs";
    }
    
    @ModelAttribute("weblogs")
    public Collection<Weblog> WeblogController.populateWeblogs() {
        return Weblog.findAllWeblogs();
    }
    
    String WeblogController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
