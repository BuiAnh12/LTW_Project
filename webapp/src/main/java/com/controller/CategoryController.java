package com.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;


import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.service.CategoryService;

import lombok.RequiredArgsConstructor;

import com.dto.ScheduleDTO;
import com.dto.StudentDTO;
import com.entity.Student;
import com.model.SearchForm;
import com.service.ScheduleService;
import com.service.StudentService;

@Controller

@RequiredArgsConstructor
@RequestMapping(value = "/category")
public class CategoryController {
	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);
	
	@Autowired
    private StudentService studentService = new StudentService();
	
	@Autowired
    private ScheduleService scheduleService;
	
	@Autowired
	private CategoryService categoryService;
	
	
	@GetMapping("/student")
	public String getStudentPage(ModelMap model) {

	    // Retrieve the list of all students
	    List<StudentDTO> students = studentService.listAll();
	    // Add students to the model
	    model.addAttribute("students", students);
	    return "student/student";
	}
	

    @GetMapping("/schedule")
    public ModelAndView getSchedule() {
    	System.out.println("This main shit running");
        List<ScheduleDTO> courseSchedules = scheduleService.getAllSchedule();
        ModelAndView mav = new ModelAndView("schedule/schedule");
        mav.addObject("schedules", courseSchedules);
        mav.addObject("searchForm", new SearchForm());
        return mav;
    }
    
    @RequestMapping(value = "/course", method = RequestMethod.GET)
    public ModelAndView getCoursePage(HttpServletRequest request, Model model) {	
        return categoryService.getCourseListPage(request, model);
    }
}
