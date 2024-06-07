package com.repository;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.jboss.logging.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.entity.CourseSchedule;

@Repository
public interface CourseScheduleRepo extends JpaRepository<CourseSchedule, Long> {
	@Query("SELECT cs FROM CourseSchedule cs WHERE cs.occurDate BETWEEN ?1 AND ?2")
    List<CourseSchedule> findByOccurDateBetween(Date startDate, Date endDate);
	
	@Query("SELECT cs FROM CourseSchedule cs")
	List<CourseSchedule> getAll();
}
