package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.entity.Course;

public interface CourseRepository extends JpaRepository<Course, Long> {
    
    @Query("SELECT COUNT(c) FROM Course c WHERE c.status = 1")
    int getActiveCourse();
}
