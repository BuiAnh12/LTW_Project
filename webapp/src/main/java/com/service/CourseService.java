package com.service;
import com.dto.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.function.Function;
import java.util.stream.Collectors;

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
	                    .status(true)
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
	public void updateCourse(UpdateCourseDto courseObject, HttpServletRequest request) {
	    final String courseId = request.getParameter("courseId");
	    Course course = courseRepository.findOne(Long.parseLong(courseId));
	    course.setCourseName(courseObject.getCourseName());
	    course.setDescription(courseObject.getDescription());
	    courseRepository.save(course);

	    List<LessonDto> existingLessons = lessonRepository.findAllLessonByCourseId(course.getCourseId());
	    System.out.println(existingLessons);
	    System.out.println("hehe"+courseObject.getLessons());
	    List<LessonDto> incomingLessons = courseObject.getLessons();
	    List<LessonDto> lessonsToAdd = new ArrayList<>();
	    List<LessonDto> lessonsToDisable = new ArrayList<>(existingLessons);

	    System.out.println("here69");
	    for (LessonDto lesson : incomingLessons) {
	        System.out.println("Lesson ID: " + lesson.getLessonId());
	        System.out.println("Lesson Name: " + lesson.getDetail());
	        // In ra các thông tin khác của bài học nếu cần
	    }
	    System.out.println("here96");
	    for (LessonDto incomingLesson : incomingLessons) {
	        if (incomingLesson.getLessonId() == null) {
	            lessonsToAdd.add(incomingLesson);
	        } else {
	            lessonsToDisable.removeIf(existingLesson -> existingLesson.getLessonId().equals(incomingLesson.getLessonId()));
	        }
	    }
	    System.out.println("here2");
	    for (LessonDto lesson : lessonsToAdd) {
	        Lesson newLesson = Lesson.builder()
	                .detail(lesson.getDetail())
	                .course(course)
	                .status(true)
	                .build();
	        lessonRepository.save(newLesson);
	    }
	    System.out.println("here3");

	    for (LessonDto lessonToDisable : lessonsToDisable) {
	        Lesson lessonToUpdate = lessonRepository.findOne(lessonToDisable.getLessonId());
	        if (lessonToUpdate != null) {
	            lessonToUpdate.setStatus(false);
	            lessonRepository.save(lessonToUpdate);
	        }
	    }
	    System.out.println("here4 ");
	}


}
