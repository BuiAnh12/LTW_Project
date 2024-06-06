package com.service;


import org.springframework.beans.factory.annotation.Autowired;

import com.entity.CourseSchedule;
import com.repository.CourseScheduleRepo;

import java.time.LocalDate;
import java.util.List;

public class test {

    @Autowired
    private CourseScheduleRepo courseScheduleRepo;

    
    public void testFindByOccurDateBetween() {
        // Define start and end dates for the date range
        LocalDate startDate = LocalDate.of(2022, 1, 1);
        LocalDate endDate = LocalDate.of(2022, 12, 31);

        // Invoke the repository method to find CourseSchedules within the date range
        List<CourseSchedule> courseSchedules = courseScheduleRepo.findByOccurDateBetween(startDate, endDate);

        System.out.print(courseSchedules);

        // Optionally, add additional assertions based on your expectations
    }
}

