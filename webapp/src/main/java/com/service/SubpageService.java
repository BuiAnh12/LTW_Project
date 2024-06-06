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
import com.repository.LessonRepository;

import lombok.RequiredArgsConstructor;
import lombok.experimental.var;

import com.entity.Course;
import com.dto.ResCourseDetails;

@Service
@RequiredArgsConstructor
public class SubpageService {
	@Autowired
	private final StaticUtilMethods staticUtilMethods;
	@Autowired
	private final CourseRepository courseRepository;
	@Autowired
	private final LessonRepository lessonRepository;
	public ModelAndView getAddCoursePage(HttpServletRequest request, Model model) {
		ModelAndView modelAndView = staticUtilMethods.customResponseModelView(request, model.asMap(), "addCourse/addCourse");
		AddCourseDto courseObject = (AddCourseDto) model.asMap().get("courseObject");
		if(courseObject != null)
			modelAndView.addObject(courseObject);
		return modelAndView;
	}
	 
	public ModelAndView getDetailsPage(HttpServletRequest request) {
	    final String courseIdStr = request.getParameter("courseId");
	    ModelAndView modelAndView = new ModelAndView("detailsCourse/detailsCourse");

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
}
