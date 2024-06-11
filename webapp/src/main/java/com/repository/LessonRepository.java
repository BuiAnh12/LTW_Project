package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dto.LessonDto;
import com.entity.Lesson;

import java.util.List;

@Repository
public interface LessonRepository extends JpaRepository<Lesson, Long> {

	@Query("SELECT new com.dto.LessonDto(l.detail, l.lessonId, l.status) FROM Lesson l WHERE l.course.id = :courseId")
	List<LessonDto> findAllLessonByCourseId(@Param("courseId") Long courseId);
	
	@Query("SELECT l FROM Lesson l WHERE l.course.id = :courseId")
	List<Lesson> findAllLessonByCourseIdVer2(@Param("courseId") Long courseId);
    
    @Modifying
    @Transactional
    @Query("DELETE FROM Lesson l WHERE l.course.id = :courseId")
    void deleteAllLessonByCourseId(@Param("courseId") Long courseId);
}
