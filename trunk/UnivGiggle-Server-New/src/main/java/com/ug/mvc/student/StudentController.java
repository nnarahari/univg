/**
 * 
 */
package com.ug.mvc.student;

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
@RequestMapping(value="/student")
public class StudentController {
	
	private Logger logger = Logger.getLogger(StudentController.class);

	
	@RequestMapping(method=RequestMethod.GET)
	public String getStudentMain(Model model) {
		logger.info("inside goToStudentMain()");
		return "students/studentMain";
	}
}
