package com.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dto.ScheduleDTO;
import com.entity.CourseSchedule;
import com.service.ScheduleService;

import lombok.Data;

@Data
@Controller
public class ScheduleController {

	@Autowired
    private ScheduleService scheduleService;

    @GetMapping
    public ModelAndView getSchedule() {
//        LocalDate startDate = LocalDate.of(2024, 6, 1);
//        LocalDate endDate = LocalDate.of(2024, 7, 1);
        
//        List<CourseSchedule> courseSchedules = scheduleService.getSchedulesWithinDateRange(startDate, endDate);
        List<CourseSchedule> courseSchedules = scheduleService.getAllSchedule();
        
        
        System.out.println("THIS SHIT IS RUNNING REAL HARD");


        ModelAndView mav = new ModelAndView("schedule/schedule");
        mav.addObject("schedules", courseSchedules);
        return mav;
    }
}

