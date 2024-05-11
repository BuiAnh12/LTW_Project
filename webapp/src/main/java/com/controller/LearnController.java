package com.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public class LearnController {
	@RequestMapping(value = "/learn", method = RequestMethod.GET)
	   public ModelAndView learnPage() {
	      ModelAndView mav = new ModelAndView("learn/learn");
	      return mav;
	   }
}
