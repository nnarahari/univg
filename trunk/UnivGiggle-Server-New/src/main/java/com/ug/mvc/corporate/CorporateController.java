/**
 * 
 */
package com.ug.mvc.corporate;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * @author srrajend
 *
 */
@Controller
@RequestMapping(value="/corporate")
public class CorporateController {

private Logger logger = Logger.getLogger(CorporateController.class);

	
	@RequestMapping(method=RequestMethod.GET)
	public String getCorporateMain(Model model) {
		logger.info("inside getCorporateMain()");
		return "corporates/corporateMain";
	}
}
