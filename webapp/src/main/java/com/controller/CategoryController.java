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
import com.utils.securityUtil;

import javassist.expr.NewArray;

@Controller

@RequiredArgsConstructor
@RequestMapping(value = "/category")
public class CategoryController {
	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);

	@Autowired
	private final StaticUtilMethods staticUtilMethods;

	@Autowired
	private StudentService studentService;

	@Autowired
	private ScheduleService scheduleService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private DashboardService dashboardService;
	
	@Autowired
	private final UserRepo userRepo;
	
	@Autowired
	private final CourseRepository courseRepository;

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboardPage() {
		DashboardModel model = dashboardService.getModel();
		List<Group> recentGroup = dashboardService.getGroup();
		List<Integer> numberOfstudent = dashboardService.getNoStudent(recentGroup);
		ModelAndView mav = new ModelAndView("dashboard/dashboard");
		mav.addObject("infoModel", model);
		mav.addObject("recentGroup", recentGroup);
		mav.addObject("student_no", numberOfstudent);
		return mav;
	}

	@GetMapping("/student")
	public ModelAndView getStudentPage(HttpServletRequest request, Model model,
			@RequestParam(required = false) String firstName,
			@RequestParam(required = false) String age,
			@RequestParam(required = false) String groupTitle,
			@RequestParam(required = false) String description,
			@RequestParam(required = false) String teacherName,
			@RequestParam(required = false) String courseName) {
		Pageable pageable = staticUtilMethods.createPageable(request);
		Page<StudentTable> studentsList = null;
		if (firstName == null && age == null && groupTitle == null && description == null && teacherName == null
				&& courseName == null) {
			studentsList = studentService.getStudentTables(null, null, null, null, null, null, pageable);
			ModelAndView mav = new ModelAndView("student/student");
			mav.addObject("students", studentsList.getContent());
			mav.addObject("currentPage", studentsList.getNumber() + 1);
			mav.addObject("totalPages", studentsList.getTotalPages());
			mav.addObject("totalItems", studentsList.getTotalElements());
			mav.addObject("pageSize", studentsList.getSize());
			return mav;
		} else {
			studentsList = studentService.getStudentTables(firstName, age, groupTitle, description, teacherName,
					courseName, pageable);
			ModelAndView mav = new ModelAndView("student/StudentTable");
			mav.addObject("students", studentsList.getContent());
			mav.addObject("currentPage", studentsList.getNumber() + 1);
			mav.addObject("totalPages", studentsList.getTotalPages());
			mav.addObject("totalItems", studentsList.getTotalElements());
			mav.addObject("pageSize", studentsList.getSize());

			mav.addObject("sName", firstName);
			mav.addObject("sAge", age);
			mav.addObject("sTitle", groupTitle);
			mav.addObject("sDesc", description);
			mav.addObject("sTeacher", teacherName);
			mav.addObject("sCourse", courseName);

			return mav;
		}

	}

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
			ModelAndView mav = new ModelAndView("schedule/schedule");
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
		ModelAndView mav = new ModelAndView("schedule/scheduleTable");
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
		return categoryService.getCourseListPage(request, model, courseName, status);
	}

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView getUserPage(HttpServletRequest request, Model model,
			@RequestParam(required = false) String id,
			@RequestParam(required = false) String name,
			@RequestParam(required = false) String phone,
			@RequestParam(required = false) String email,
			@RequestParam(required = false) String role,
			@RequestParam(required = false) String account,
			@RequestParam(required = false) String status) {
		Pageable pageable = staticUtilMethods.createPageable(request);
		Page<showMainViewUserDTO> userList = null;
		if (id == null && name == null && phone == null && email == null && role == null && account == null
				&& status == null) {
			userList = categoryService.getUserListPage(request, model,
					id, name, phone, email, role, account, status, pageable);
			ModelAndView mav = new ModelAndView("user/user");
			mav.addObject("userList", userList.getContent());
			mav.addObject("currentPage", userList.getNumber() + 1);
			mav.addObject("totalPages", userList.getTotalPages());
			mav.addObject("totalItems", userList.getTotalElements());
			mav.addObject("pageSize", userList.getSize());
			return mav;
		} else {
			userList = categoryService.getUserListPage(request, model,
					id, name, phone, email, role, account, status, pageable);
			ModelAndView mav = new ModelAndView("user/userTable");
			mav.addObject("userList", userList.getContent());
			mav.addObject("currentPage", userList.getNumber() + 1);
			mav.addObject("totalPages", userList.getTotalPages());
			mav.addObject("totalItems", userList.getTotalElements());
			mav.addObject("pageSize", userList.getSize());

			mav.addObject("sId", id);
			mav.addObject("sName", name);
			mav.addObject("sPhone", phone);
			mav.addObject("sEmail", email);
			mav.addObject("sRole", role);
			mav.addObject("sAccount", account);
			mav.addObject("sStatus", status);
			return mav;
		}
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
		List<User> teacherList = userRepo.findAllTeacher();
		List<User> supervisorList = userRepo.findAllSupervisor();
		List<Course> courseList = courseRepository.findAll();
		Page<ResGroupDto> groupList = null;
		if (title == null && student == null && teacher == null && supervisor == null && course == null
				&& format == null) {
			groupList = categoryService.getGroupListPage(request, model, title, student, teacher, supervisor, course,
					format, pageable);
			ModelAndView mav = new ModelAndView("group/group");
			mav.addObject("groupList", groupList.getContent());
			mav.addObject("currentPage", groupList.getNumber() + 1);
			mav.addObject("totalPages", groupList.getTotalPages());
			mav.addObject("totalItems", groupList.getTotalElements());
			mav.addObject("pageSize", groupList.getSize());
			mav.addObject("courseList",courseList);
			mav.addObject("teacherList",teacherList);
			mav.addObject("supervisorList",supervisorList);
			return mav;
		} else {
			groupList = categoryService.getGroupListPage(request, model, title, student, teacher, supervisor, course,
					format, pageable);
			ModelAndView mav = new ModelAndView("group/GroupTable");
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
