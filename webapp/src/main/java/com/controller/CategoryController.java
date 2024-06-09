package com.controller;
import org.apache.taglibs.standard.lang.jstl.AndOperator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;


import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.service.CategoryService;
import com.service.DashboardService;

import lombok.RequiredArgsConstructor;

import com.dto.ScheduleDTO;
import com.dto.StudentDTO;
import com.entity.Group;
import com.entity.Student;
import com.model.DashboardModel;
import com.model.SearchForm;
import com.model.StudentTable;
import com.service.ScheduleService;
import com.service.StudentService;

import javassist.expr.NewArray;

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
	
	@Autowired
	private DashboardService dashboardService;
	
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboardPage() {
		DashboardModel model = dashboardService.getModel();
		List<Group> recentGroup = dashboardService.getGroup();
		List<Integer> numberOfstudent = dashboardService.getNoStudent(recentGroup);
	    ModelAndView mav = new ModelAndView("dashboard/dashboard");
	    mav.addObject("infoModel",model);
	    mav.addObject("recentGroup", recentGroup);
	    mav.addObject("student_no", numberOfstudent);
	    return mav;
	}
	
	@GetMapping("/student")
	public ModelAndView getStudentPage( @RequestParam(required = false) String firstName,
			@RequestParam(required = false) String age,
			@RequestParam(required = false) String groupTitle,
			@RequestParam(required = false) String description,
			@RequestParam(required = false) String teacherName,
			@RequestParam(required = false) String courseName) {
		List<StudentTable> studentsList = null;
		if (firstName == null && age == null && groupTitle == null 
				&& description == null && teacherName == null && courseName == null) {
			studentsList = studentService.getStudentTables(null, null, null, null, null, null);
			ModelAndView mav = new ModelAndView("student/student");
	        mav.addObject("students", studentsList);
	        return mav;
		}
		else {
			studentsList = studentService.getStudentTables(firstName, age, groupTitle, description, teacherName, courseName);
			ModelAndView mav = new ModelAndView("student/StudentTable");
	        mav.addObject("students", studentsList);
	        return mav;
		}
	} 
	
    

    @GetMapping("/schedule")
    public ModelAndView getScheduleBySearch( @RequestParam(required = false) String startDate, 
            @RequestParam(required = false) String endDate,
            @RequestParam(required = false) String nextLesson,
            @RequestParam(required = false) String courseName,
            @RequestParam(required = false) String groupTitle,
            @RequestParam(required = false) String teacherName,
            @RequestParam(required = false) String format) {
        System.out.println("=========== START OF SEARCHING ===========");
    	// Log the search form fields
        System.out.println("Start Date: " + startDate);
        System.out.println("End Date: " + endDate);
        System.out.println("Next Lesson: " + nextLesson);
        System.out.println("Course Name: " + courseName);
        System.out.println("Group Title: " + groupTitle);
        System.out.println("Teacher Name: " + teacherName);
        System.out.println("Format: " + format);
        List<ScheduleDTO> courseSchedules = null;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        if (startDate == null && endDate == null) {
        	Date todayDate = new Date();
        	courseSchedules = scheduleService.getSchedulesWithinDateRange(todayDate, todayDate,nextLesson,courseName,groupTitle,teacherName,format);
            ModelAndView mav = new ModelAndView("schedule/schedule");
            mav.addObject("schedules", courseSchedules);
            return mav;
		}
        try {
            // Parse the start and end dates from the search form
            LocalDate localStartDate = LocalDate.parse(startDate, formatter);
            LocalDate localEndDate = LocalDate.parse(endDate, formatter);

            // Convert LocalDate to java.util.Date
            Date startDateConverted = Date.from(localStartDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
            Date endDateConverted = Date.from(localEndDate.atStartOfDay(ZoneId.systemDefault()).toInstant());

            // Fetch the schedules within the date range
            courseSchedules = scheduleService.getSchedulesWithinDateRange(startDateConverted, endDateConverted,nextLesson,courseName,groupTitle,teacherName,format);
        } catch (DateTimeParseException e) {
            System.out.println("Invalid date format: " + e.getMessage());
            // Handle the error appropriately, e.g., add an error message to the model
        }
     // Add the results and search form to the redirect attributes
        System.out.println("=========== END OF SEARCHING ===========");
        ModelAndView mav = new ModelAndView("schedule/scheduleTable");
        mav.addObject("schedules", courseSchedules);
        return mav;
    }
    @RequestMapping(value = "/group-detail", method = RequestMethod.GET)
    public ModelAndView getGroupDetail() {	
        return new ModelAndView("group/GroupDetail/groupDetail");
    }
    
    
    @RequestMapping(value = "/course", method = RequestMethod.GET)
    public ModelAndView getCoursePage(HttpServletRequest request, Model model) {	
        return categoryService.getCourseListPage(request, model);
    }
}
