package com.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.ScheduleDTO;
import com.entity.Course;
import com.entity.CourseSchedule;
import com.entity.Group;
import com.entity.Lesson;
import com.entity.User;
import com.repository.CourseScheduleRepo;
import com.repository.GroupRepo;
import com.repository.LessonRepo;
import com.repository.UserRepo;

@Service
public class ScheduleService {

	@Autowired
    private CourseScheduleRepo courseScheduleRepo;

    public List<CourseSchedule> getSchedulesWithinDateRange(LocalDate startDate, LocalDate endDate) {
        return courseScheduleRepo.findByOccurDateBetween(startDate, endDate);
    }
    
    public List<CourseSchedule> getAllSchedule(){
    	List<CourseSchedule> courseSchedules = courseScheduleRepo.getAll();
    	
    	return courseSchedules;
    }
}
