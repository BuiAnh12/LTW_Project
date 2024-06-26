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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

import com.config.StaticUtilMethods;
import com.dto.ResGroupDto;
import com.dto.ScheduleDTO;
import com.dto.StudentDTO;
import com.dto.showMainViewUserDTO;
import com.entity.Course;
import com.entity.Group;
import com.entity.Role;
import com.entity.Student;
import com.entity.User;
import com.model.DashboardModel;
import com.model.SearchForm;
import com.model.StudentTable;
import com.repository.CourseRepository;
import com.repository.StudentRepo;
import com.repository.UserRepo;
import com.service.ScheduleService;
import com.service.StudentService;
import com.service.TeacherCategoryService;
import com.utils.securityUtil;
import javassist.expr.NewArray;

@Controller

@RequiredArgsConstructor
@RequestMapping(value = "/teacher")
public class CategoryTeacherController {
	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);

	@Autowired
	private final StaticUtilMethods staticUtilMethods;

	@Autowired
	private ScheduleService scheduleService;

	@Autowired
	private TeacherCategoryService teacherCategoryService;
	
	@Autowired
	private final UserRepo userRepo;
	
	@Autowired
	private final CourseRepository courseRepository;
	

	@GetMapping("/schedule")
	public ModelAndView getScheduleBySearch(HttpServletRequest request, Model model,
			@RequestParam(required = false) String startDate,
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
		Page<ScheduleDTO> courseSchedules = null;
		Pageable pageable = staticUtilMethods.createPageable(request);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		if (startDate == null && endDate == null) {
			Date todayDate = new Date();
			courseSchedules = scheduleService.getSchedulesWithinDateRange(todayDate, todayDate, nextLesson, courseName,
					groupTitle, teacherName, format, pageable);
			ModelAndView mav = new ModelAndView("teacherviews/schedule/schedule");
			// mav.addObject("schedules", courseSchedules);
			mav.addObject("schedules", courseSchedules.getContent());
			mav.addObject("currentPage", courseSchedules.getNumber() + 1);
			mav.addObject("totalPages", courseSchedules.getTotalPages());
			mav.addObject("totalItems", courseSchedules.getTotalElements());
			mav.addObject("pageSize", courseSchedules.getSize());
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
			courseSchedules = scheduleService.getSchedulesWithinDateRange(startDateConverted, endDateConverted,
					nextLesson, courseName, groupTitle, teacherName, format, pageable);
		} catch (DateTimeParseException e) {
			System.out.println("Invalid date format: " + e.getMessage());
			// Handle the error appropriately, e.g., add an error message to the model
		}
		// Add the results and search form to the redirect attributes
		System.out.println("=========== END OF SEARCHING ===========");
		ModelAndView mav = new ModelAndView("teacherviews/schedule/scheduleTable");
		// mav.addObject("schedules", courseSchedules);
		mav.addObject("schedules", courseSchedules.getContent());
		mav.addObject("currentPage", courseSchedules.getNumber() + 1);
		mav.addObject("totalPages", courseSchedules.getTotalPages());
		mav.addObject("totalItems", courseSchedules.getTotalElements());
		mav.addObject("pageSize", courseSchedules.getSize());

		mav.addObject("sLesson", nextLesson);
		mav.addObject("sCourse", courseName);
		mav.addObject("sTitle", groupTitle);
		mav.addObject("sTeacher", teacherName);
		mav.addObject("sStatus", format);
		return mav;
	}

	@RequestMapping(value = "/course", method = RequestMethod.GET)
	public ModelAndView getCoursePage(HttpServletRequest request, Model model,
			@RequestParam(required = false) String courseName, @RequestParam(required = false) String status) {
		return teacherCategoryService.getCourseListPage(request, model, courseName, status);
	}


	@RequestMapping(value = "/group", method = RequestMethod.GET)
	public ModelAndView getGroupPage(HttpServletRequest request, Model model,
			@RequestParam(required = false) String title,
			@RequestParam(required = false) String student,
			@RequestParam(required = false) String teacher,
			@RequestParam(required = false) String supervisor,
			@RequestParam(required = false) String course,
			@RequestParam(required = false) String format) {
		Pageable pageable = staticUtilMethods.createPageable(request);
		List<Role> roleList = securityUtil.getPrincipal().getPreveledge();
		List<User> teacherList = userRepo.findAllTeacher();
		List<User> supervisorList = userRepo.findAllSupervisor();
		List<Course> courseList = courseRepository.findAll();
		Page<ResGroupDto> groupList = null;
		if (title == null && student == null && teacher == null && supervisor == null && course == null
				&& format == null) {
			groupList = teacherCategoryService.getGroupListPage(request, model, title, student, teacher, supervisor, course,
					format, pageable);
			ModelAndView mav = new ModelAndView("teacherviews/group/group");
			mav.addObject("groupList", groupList.getContent());
			mav.addObject("currentPage", groupList.getNumber() + 1);
			mav.addObject("totalPages", groupList.getTotalPages());
			mav.addObject("totalItems", groupList.getTotalElements());
			mav.addObject("pageSize", groupList.getSize());
			mav.addObject("roleList", roleList);
			mav.addObject("courseList",courseList);
			mav.addObject("teacherList",teacherList);
			mav.addObject("supervisorList",supervisorList);
			return mav;
		} else {
			groupList = teacherCategoryService.getGroupListPage(request, model, title, student, teacher, supervisor, course,
					format, pageable);
			ModelAndView mav = new ModelAndView("teacherviews/group/GroupTable");
			mav.addObject("groupList", groupList.getContent());
			mav.addObject("currentPage", groupList.getNumber() + 1);
			mav.addObject("totalPages", groupList.getTotalPages());
			mav.addObject("totalItems", groupList.getTotalElements());
			mav.addObject("pageSize", groupList.getSize());

			mav.addObject("sTitle", title);
			mav.addObject("sStudent", student);
			mav.addObject("sTeacher", teacher);
			mav.addObject("sSupervisor", supervisor);
			mav.addObject("sCourse", course);
			mav.addObject("sFormat", format);
			return mav;
		}

	}
}
