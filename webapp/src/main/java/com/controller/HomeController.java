package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
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
	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView loginPage() {
	    ModelAndView mav = new ModelAndView("login/login");
	      return mav;
	   }
	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/dang-nhap?accessDenied");
	}
}
