package com.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.Course;
public interface CourseRepository extends JpaRepository<Course, Long>{
	
}
