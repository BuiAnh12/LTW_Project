package com.controller;

import com.model.SearchForm;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    @GetMapping("/schedule/search")
    public ModelAndView getScheduleBySearch(@ModelAttribute("searchForm") SearchForm searchForm) {
        // Log the search form fields
        System.out.println("Start Date: " + searchForm.getStartDate());
        System.out.println("End Date: " + searchForm.getEndDate());
        System.out.println("Next Lesson: " + searchForm.getNextLesson());
        System.out.println("Course Name: " + searchForm.getCourseName());
        System.out.println("Group Title: " + searchForm.getGroupTitle());
        System.out.println("Teacher Name: " + searchForm.getTeacherName());

        // Logic to handle the search based on the search form fields
//        List<ScheduleDTO> courseSchedules = scheduleService.getSchedulesWithinDateRange(
//                LocalDate.parse(searchForm.getStartDate()), 
//                LocalDate.parse(searchForm.getEndDate())
//        );

        ModelAndView mav = new ModelAndView("schedule/schedule");
        mav.addObject("schedules", courseSchedules);
        return mav;
    }

    
   
}

