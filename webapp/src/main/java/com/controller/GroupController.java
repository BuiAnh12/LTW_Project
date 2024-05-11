package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import lombok.Data;

@Controller
@Data
public class GroupController {
	@RequestMapping(value = "/group", method = RequestMethod.GET)
	   public ModelAndView group() {
	      ModelAndView mav = new ModelAndView("group/group");
	      return mav;
	   }
}
