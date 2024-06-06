package com.repository;
<<<<<<< HEAD
import org.springframework.data.jpa.repository.JpaRepository;
=======


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.dto.LessonDto;
>>>>>>> origin/hnyyy
import com.entity.Course;

public interface CourseRepository extends JpaRepository<Course, Long>{
	
}
