package com.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class VenuesController {
	@RequestMapping(value = "/venues", method = RequestMethod.GET)
	   public ModelAndView venuesPage() {
	      ModelAndView mav = new ModelAndView("venues/venues");
	      return mav;
	   }
}
