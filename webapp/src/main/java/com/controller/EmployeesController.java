package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.Data;

@Controller
@Data
public class EmployeesController {
	@RequestMapping(value = "/employees", method = RequestMethod.GET)
	   public ModelAndView coursePage() {
	      ModelAndView mav = new ModelAndView("employees/employees");
	      return mav;
	   }
}
