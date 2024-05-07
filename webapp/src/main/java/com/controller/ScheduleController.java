package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import lombok.Data;

@Data
@Controller
public class ScheduleController {
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	   public ModelAndView schedule() {
	      ModelAndView mav = new ModelAndView("schedule/schedule");
	      return mav;
	   }
}
