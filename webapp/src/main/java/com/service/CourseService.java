package com.service;

import java.util.NoSuchElementException;
import com.repository.LessonRepository;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.AddCourseDto;
import com.entity.Course;
import com.entity.Lesson;
import com.repository.CourseRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CourseService {
	@Autowired
	private final CourseRepository courseRepository;
	@Autowired
	private final LessonRepository lessonRepository;
	@Transactional(rollbackOn = {Exception.class})
	public void addCourse(AddCourseDto courseObject) {
	    Course course = Course.builder()
	            .courseName(courseObject.getCourseName())
	            .description(courseObject.getDescription())
	            .status(true)
	            .build();
	    courseRepository.save(course);
	    if (courseObject.getLessons() != null) {
	        for (String lessonName : courseObject.getLessons()) {
	            Lesson lesson = Lesson.builder()
	                    .detail(lessonName)
	                    .course(course)
	                    .build();
	            lessonRepository.save(lesson);
	        }
	    }
	}
	
	
	@Transactional(rollbackOn = {Exception.class})
	public void deleteCourse(HttpServletRequest request) {
		System.out.println("i'm svc");
		Long courseId = Long.parseLong(request.getParameter("courseId"));
		if (!courseRepository.exists(courseId))
			throw new NoSuchElementException("Course Id not found!");
		courseRepository.delete(courseId);
		lessonRepository.deleteAllLessonByCourseId(courseId);
		System.out.println("i'm here hehe");
	}
	
	@Transactional(rollbackOn = {Exception.class})
	public void updateCourse(AddCourseDto courseObject, HttpServletRequest request) {
		final String courseId = request.getParameter("courseId");
		Course course = courseRepository.findOne(Long.parseLong(courseId));
		course.setCourseName(courseObject.getCourseName());
		course.setDescription(courseObject.getDescription());
		courseRepository.save(course);
		System.out.println("here1");
		lessonRepository.deleteAllLessonByCourseId(course.getCourseId());
		System.out.println("here");
		if (courseObject.getLessons() != null) {
	        for (String lessonName : courseObject.getLessons()) {
	            Lesson lesson = Lesson.builder()
	                    .detail(lessonName)
	                    .course(course)
	                    .build();
	            lessonRepository.save(lesson);
	            System.out.println("here3");
	        }
	        System.out.println("here4");
	    }	
	}
}
