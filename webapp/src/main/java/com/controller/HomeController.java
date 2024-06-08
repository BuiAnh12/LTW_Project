package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.Data;
@Data
@Controller
public class HomeController {
	
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	   public ModelAndView homePage() {
	      ModelAndView mav = new ModelAndView("home");
	      return mav;
	   }
	  
	@RequestMapping(value = "/springmvc", method = RequestMethod.GET)
	   public ModelAndView springMVCPage() {
	      ModelAndView mav = new ModelAndView("springmvc");
	      return mav;
	   }
	  
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
		public ModelAndView dashboardPage() {
		    ModelAndView mav = new ModelAndView("dashboard/dashboard");
		      return mav;
		   }
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView indexPage() {
	    ModelAndView mav = new ModelAndView("dashboard/dashboard");
	      return mav;
	   }
}
