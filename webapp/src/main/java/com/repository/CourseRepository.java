package com.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.dto.LessonDto;
import com.entity.Course;
public interface CourseRepository extends JpaRepository<Course, Long>{
	
}
