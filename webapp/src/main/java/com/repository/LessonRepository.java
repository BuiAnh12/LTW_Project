package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.entity.Lesson;

import java.util.List;

@Repository
public interface LessonRepository extends JpaRepository<Lesson, Long> {

    @Query("SELECT l.detail FROM Lesson l WHERE l.course.id = :courseId")
    List<String> findAllLessonByCourseId(@Param("courseId") Long courseId);
    
    @Modifying
    @Query("DELETE FROM Lesson l WHERE l.course.id = :courseId")
    void deleteAllLessonByCourseId(@Param("courseId") Long courseId);
}
