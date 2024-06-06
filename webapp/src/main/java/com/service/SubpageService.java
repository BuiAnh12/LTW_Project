package com.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.entity.Lesson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import com.config.StaticUtilMethods;
import com.dto.AddCourseDto;
import com.repository.CourseRepository;
import com.repository.LessonRepository;

import lombok.RequiredArgsConstructor;
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
		final String courseId = request.getParameter("courseId");
		ModelAndView modelAndView = new ModelAndView("detailsCourse/detailsCourse");
		if(courseId == null)
			throw new NullPointerException("courseId is null");
		Course course = courseRepository.findOne(Long.parseLong(courseId));
		List<String> lessons = lessonRepository.findAllLessonByCourseId(Long.parseLong(courseId));
		modelAndView.addObject("courseObject", ResCourseDetails.builder()
				.courseId(course.getCourseId())
				.courseName(course.getCourseName())
				.description(course.getDescription())
				.lessons(lessons)
				.build());	
		return modelAndView;
	}
}
