package com.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import com.config.StaticUtilMethods;
import com.dto.AddCourseDto;
import com.dto.LessonDto;
import com.repository.CourseRepository;
import com.repository.GroupRepo;
import com.repository.LessonRepository;
import com.repository.RegistrationRepository;
import com.repository.StudentRepo;
import com.repository.UserRepo;

import lombok.RequiredArgsConstructor;
import lombok.experimental.var;

import com.entity.Course;
import com.entity.Group;
import com.entity.Student;
import com.entity.User;
import com.dto.ResCourseDetails;
import com.dto.ResGroupDetailDto;
import com.dto.ResGroupDto;
import com.dto.courseScheduleDTO;
import com.dto.studentRegistrationDto;
import com.entity.Registration;
@Service
@RequiredArgsConstructor
public class SubpageService {
	@Autowired
	private final StaticUtilMethods staticUtilMethods;
	@Autowired
	private final CourseRepository courseRepository;
	@Autowired
	private final LessonRepository lessonRepository;
	@Autowired
	private final GroupRepo groupRepo;
	@Autowired
	private final UserRepo userRepo;
	@Autowired
	private final RegistrationRepository registrationRepository;
	@Autowired
	private final StudentRepo studentRepo;
	@Autowired
	private final GroupService groupService;
	
	public ModelAndView getAddCoursePage(HttpServletRequest request, Model model) {
		ModelAndView modelAndView = staticUtilMethods.customResponseModelView(request, model.asMap(), "/course/addCourse/addCourse");
		AddCourseDto courseObject = (AddCourseDto) model.asMap().get("courseObject");
		if(courseObject != null)
			modelAndView.addObject(courseObject);
		return modelAndView;
	}
	
	public void addStudentToCourse(Long studentId, Long groupId) {
		registrationRepository.addStudentInGroup(groupId, studentId);
	}
	 
	public ModelAndView getDetailsPage(HttpServletRequest request) {
	    final String courseIdStr = request.getParameter("courseId");
	    ModelAndView modelAndView = new ModelAndView("/course/detailsCourse/detailsCourse");

	    if (courseIdStr == null) {
	        throw new IllegalArgumentException("courseId is null");
	    }

	    try {
	        Long courseId = Long.parseLong(courseIdStr);
	        
	        Course course = courseRepository.findOne(courseId);
	        if (course == null) {
	            throw new IllegalArgumentException("Course not found for id: " + courseId);
	        }

	        List<LessonDto> lessons = lessonRepository.findAllLessonByCourseId(courseId);
	        if (lessons == null) {
	            lessons = new ArrayList<>();
	        }
	        ResCourseDetails courseDetails = ResCourseDetails.builder()
	                .courseId(course.getCourseId())
	                .courseName(course.getCourseName())
	                .description(course.getDescription())
	                .lessons(lessons)
	                .build();
	        modelAndView.addObject("courseObject", courseDetails);
	    } catch (NumberFormatException e) {
	        throw new IllegalArgumentException("Invalid courseId: " + courseIdStr, e);
	    } catch (Exception e) {
	        // Log the exception and rethrow or handle it accordingly
	        throw new RuntimeException("Error retrieving course details", e);
	    }
	    return modelAndView;
	}
	
	public ModelAndView getDetailGroup(HttpServletRequest request) {
		
		final String groupIdStr = request.getParameter("groupId");
		Integer groupId = Integer.parseInt(groupIdStr);
		Group group = groupRepo.findOne(groupId);		
	    ModelAndView modelAndView = new ModelAndView("/group/GroupDetail/groupDetail");
    	User teacher = userRepo.findOne(group.getMainTeacher().getId());
    	User supervisor = userRepo.findOne(group.getSupervisor().getId());
    	List<User> teacherList = userRepo.findAllTeacher();
    	List<User> supervisorList = userRepo.findAllSupervisor();
    	List<Course> courseList = courseRepository.findAll();
    	Course course = courseRepository.findOne(group.getCourse().getCourseId());
    	List<studentRegistrationDto> studenList = registrationRepository.findAllByGroupId(groupId);
//    	List<LessonDto> lessonList = lessonRepository.findAllLessonByCourseId(course.getCourseId());
    	List<Student> studentForAdding = studentRepo.findAll();
    	List<courseScheduleDTO> csList = groupService.getCSList(groupId);
    	ResGroupDetailDto groupDto = ResGroupDetailDto.builder()
        		.title(group.getTitle())
        		.teacher(teacher.getName())
        		.supervisor(supervisor.getName())
        		.course(course.getCourseName())
        		.startDate(group.getStartDate())
        		.endDate(group.getEndDate())
        		.status(group.getStatus())
        		.note(group.getGroupDetail())
        		.build();
    	modelAndView.addObject("groupId",groupId);
    	modelAndView.addObject("students",studentForAdding);
    	modelAndView.addObject("lessonList",csList);
    	modelAndView.addObject("groupObject",groupDto);
    	modelAndView.addObject("studentList", studenList);
    	modelAndView.addObject("teacherList",teacherList);
    	modelAndView.addObject("supervisorList",supervisorList);
    	modelAndView.addObject("courseList", courseList);
    	
	    return modelAndView;
	}
}
