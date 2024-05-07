package com.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class StudentController {
	@RequestMapping(value = "/student", method = RequestMethod.GET)
	   public ModelAndView studentPage() {
	      ModelAndView mav = new ModelAndView("student/student");
	      return mav;
	   }
}
