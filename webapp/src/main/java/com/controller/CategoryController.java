package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/category")
public class CategoryController {

    @RequestMapping(value = "/schedule", method = RequestMethod.GET)
    public ModelAndView getSchedulePage(HttpServletRequest request, Model model) {

        ModelAndView mav = new ModelAndView("schedule/schedule");
        return mav;
    }
}
