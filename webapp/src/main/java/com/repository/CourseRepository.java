package com.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.entity.Course;

public interface CourseRepository extends JpaRepository<Course, Long> {
    Page<Course> findAll(Pageable pageable);
    @Query("SELECT COUNT(c) FROM Course c WHERE c.status = 1")
    int getActiveCourse();
}
