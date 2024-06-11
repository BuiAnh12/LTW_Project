package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.config.StaticUtilMethods;
import com.dto.ResGroupDto;
import com.dto.StudentDTO;
import com.dto.courseScheduleDTO;
import com.entity.Course;
import com.entity.Group;
import com.entity.Registration;
import com.entity.Student;
import com.entity.User;
import com.repository.CourseRepository;
import com.repository.GroupRepo;
import com.repository.RegistrationRepository;
import com.repository.StudentRepo;
import com.repository.UserRepo;
import com.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	private GroupRepo groupRepo;
	@Autowired
	private UserRepo userRepo;
	@Autowired
	private CourseRepository courseRepository;
	@Autowired
	private RegistrationRepository registrationRepository;
	@Autowired
	private StudentService studentService;

	@GetMapping("student/insert")
	public String getStudentPage(ModelMap model) {
		StudentDTO student = new StudentDTO();
		List<ResGroupDto> groupDtoList = new ArrayList<>();
		List<Group> groupList = groupRepo.findAll();
		List<User> teacherList = userRepo.findAllTeacher();
		List<User> supervisorList = userRepo.findAllSupervisor();
		List<Course> courseList = courseRepository.findAll();
		Long registrationGroupId = (long) 0;

		for (Group group : groupList) {
			String formatDescription = group.getFormat() ? "online" : "offline";
			User teacher = userRepo.findOne(group.getMainTeacher().getId());
			User supervisor = userRepo.findOne(group.getSupervisor().getId());
			Course course = courseRepository.findOne(group.getCourse().getCourseId());
			Long numOfStudent = registrationRepository.countByGroupId(group.getId());
			ResGroupDto groupDto = ResGroupDto.builder()
					.id(group.getId())
					.title(group.getTitle())
					.numOfStudent(numOfStudent)
					.teacher(teacher.getName())
					.supervisor(supervisor.getName())
					.course(course.getCourseName())
					.format(formatDescription)
					.build();
			groupDtoList.add(groupDto);
		}
		model.addAttribute("registrationGroup", registrationGroupId);
		model.addAttribute("groupList", groupDtoList);
		model.addAttribute("courseList", courseList);
		model.addAttribute("teacherList", teacherList);
		model.addAttribute("supervisorList", supervisorList);
		model.addAttribute("student", student);
		return "student/insert/insertStudent";
	}

	@RequestMapping(value = "/student/insert", method = RequestMethod.POST)
	public String saveStudent(@ModelAttribute("student") StudentDTO student, BindingResult result, ModelMap model,
			@RequestParam(required = false, value = "groupId") String groupId) {
		System.out.println("GroupId: " + groupId);
		if (result.hasErrors()) {
			System.out.println("Received error");
			for (ObjectError error : result.getAllErrors()) {
				if (error instanceof FieldError) {
					FieldError fieldError = (FieldError) error;
					System.out
							.println("Field error: " + fieldError.getField() + " - " + fieldError.getDefaultMessage());
				} else {
					System.out.println("Object error: " + error.getObjectName() + " - " + error.getDefaultMessage());
				}
			}
			return "student/insert";
		}
		Student tmp = studentService.insertStudent(student);
		if (groupId != null && groupId != "") {
			registrationRepository.addStudentInGroup(Long.valueOf(groupId), tmp.getId());
		}

		return "redirect:/category/student";
	}

	@GetMapping("/student/detail/{id}")
	public String getStudentDetail(@PathVariable("id") Long id, ModelMap model) {
		StudentDTO student = studentService.getStudentById(id);
		List<ResGroupDto> groupDtoList = new ArrayList<>();
		List<Group> groupList = groupRepo.findAll();
		List<User> teacherList = userRepo.findAllTeacher();
		List<User> supervisorList = userRepo.findAllSupervisor();
		List<Course> courseList = courseRepository.findAll();
		Long registrationGroupId = studentService.getRegistrationGroup(id);

		for (Group group : groupList) {
			String formatDescription = group.getFormat() ? "online" : "offline";
			User teacher = userRepo.findOne(group.getMainTeacher().getId());
			User supervisor = userRepo.findOne(group.getSupervisor().getId());
			Course course = courseRepository.findOne(group.getCourse().getCourseId());
			Long numOfStudent = registrationRepository.countByGroupId(group.getId());
			ResGroupDto groupDto = ResGroupDto.builder()
					.id(group.getId())
					.title(group.getTitle())
					.numOfStudent(numOfStudent)
					.teacher(teacher.getName())
					.supervisor(supervisor.getName())
					.course(course.getCourseName())
					.format(formatDescription)
					.build();
			groupDtoList.add(groupDto);
		}
		model.addAttribute("registrationGroup", registrationGroupId);
		model.addAttribute("groupList", groupDtoList);
		model.addAttribute("courseList", courseList);
		model.addAttribute("teacherList", teacherList);
		model.addAttribute("supervisorList", supervisorList);
		model.addAttribute("student", student);
		return "student/detail/detailStudent";
	}

	@PostMapping("/student/update")
	public String updateStudent(@RequestParam("id") Long id,
			@ModelAttribute("student") StudentDTO Updatestudent, ModelMap model,
			@RequestParam(required = false, value = "groupId") String groupId,
			@RequestParam(required = true, value = "registrationGroup") Integer registrationGroup) {
		try {
			System.out.println("StudentID PASS: " + id);
			System.out.println("StudentID from Update Student: " + Updatestudent.getId());
			System.out.println("GroupId after" + groupId);
			System.out.println("GroupId before" + registrationGroup);

			studentService.updateStudentById(id, Updatestudent);
			List<Registration> registrations = registrationRepository.findAll();

			for (Registration registration : registrations) {
				if (registration.getStudent().getId() == Updatestudent.getId()
						&& registration.getGroup().getId() == registrationGroup) {
					registrationRepository.delete(registration);
					break;
				}
			}
			if (groupId != null) {
				registrationRepository.addStudentInGroup(Long.valueOf(groupId), Updatestudent.getId());
			}
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Error deleting student: " + e.getMessage());
			System.out.println("ERROR");
			return "student/detail/detailStudent";
		}
		return "redirect:/category/student";
	}

	@PostMapping("/student/delete")
	public String deleteStudent(@RequestParam("id") Long id, ModelMap model) {
		try {
			registrationRepository.deleteByStudentId(id);
			studentService.deleteStudentById(id);
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Error deleting student: " + e.getMessage());
			return "student/detail/detailStudent";
		}
		return "redirect:/category/student";
	}
}
