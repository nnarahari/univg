package com.ug.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ug.domain.Loan;

import org.apache.log4j.Logger;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

@RooWebScaffold(path = "loans", formBackingObject = Loan.class)
@RequestMapping("/loans")
@Controller
public class LoanController {
	
	private  Logger logger = Logger.getLogger(LoanController.class);
	
	@InitBinder
    public void initBinder(WebDataBinder binder)
    {
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
    }
	
	
	@RequestMapping(value = "/getLoanTemplate",method=RequestMethod.GET)
	public String getLoanTemplate(HttpServletRequest req, HttpServletResponse res){
		logger.debug("getLoanTemplate() started...");
		File file = new File("C:/ug/template/LoanTemplate.pdf"); 
    	
    	res.setContentType("pdf");
    	res.setContentLength((int) file.length());
    	res.setHeader("Content-Disposition","attachment; filename=\"" + file.getName() +"\"");
    	try {
			FileCopyUtils.copy(new FileInputStream(file), res.getOutputStream());
		} catch (IOException e) {
			logger.error("Error during file dowonload.....",e);
		}
		return null;
		
	}
	
	
	@RequestMapping(value = "/learnAboutLoan",method=RequestMethod.GET)
	public String getLearnAbtLoan(HttpServletRequest req, HttpServletResponse res, Model uiModel){
		logger.debug("getLearnAbtLoan() started...");
		
		uiModel.addAttribute("loans", null);
		return "loans/learnAboutLoan";
		
	}

}
