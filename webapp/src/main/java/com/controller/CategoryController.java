package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.service.CategoryService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/category")
public class CategoryController {
	@Autowired
	private final CategoryService categoryService ;

    @RequestMapping(value = "/schedule", method = RequestMethod.GET)
    public ModelAndView getSchedulePage(HttpServletRequest request, Model model) {

        ModelAndView mav = new ModelAndView("schedule/schedule");
        return mav;
    }
    
    @RequestMapping(value = "/course", method = RequestMethod.GET)
    public ModelAndView getCoursePage(HttpServletRequest request, Model model) {	
        return categoryService.getCourseListPage(request, model);
    }
    
    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public ModelAndView getEmployeesPage(HttpServletRequest request , Model model) {
    	return categoryService.getUserListPage(request, model);
    }
}
