package com.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entity.CourseSchedule;
import com.entity.Registration;
import com.entity.User;
import com.google.protobuf.TextFormat.ParseException;
import com.repository.CourseScheduleRepo;
import com.repository.GroupRepo;
import com.repository.RegistrationRepository;
import com.repository.UserRepo;
import com.service.StudentService;

import lombok.Data;

@Controller
@Data
public class GroupController {
	@Autowired
    private RegistrationRepository registrationRepository;
	
	@Autowired
	private CourseScheduleRepo courseScheduleRepo;
	
	@Autowired
	private UserRepo userRepo;

    @GetMapping("/group/delete-student")
    public String deleteStudent(@RequestParam Long studentId,
    		@RequestHeader(value = "referer", required = false) String referer) {
        // Add logic to delete the student by ID
    	List<Registration> registrations = registrationRepository.findAll();
    	for (Registration registration : registrations) {
    		if (registration.getStudent().getId() == studentId) {
    			registrationRepository.delete(registration);
    			break;
    		}
    	}
        // Redirect to the Group page or any other appropriate page
    	return referer != null ? "redirect:" + referer : "redirect:/defaultPage";
    }
    @GetMapping("/group/edit-lesson")
    public String editLesson(@RequestParam("lessonId") Long lessonId,
				            @RequestParam("date") String date,
				            @RequestParam("teacherId") Long teacherId,
				            @RequestParam("status") String status){
        System.out.println("Received lessonId: " + lessonId);
        System.out.println("Received date: " + date);
        System.out.println("Received teacherId: " + teacherId);
        System.out.println("Received status: " + status);

        boolean stas = "open".equals(status);

        LocalDate localDate;
        try {
            localDate = LocalDate.parse(date);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle parse exception, maybe return an error message or page
            return "redirect:/errorPage";
        }

        Date occurDate = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());

        List<CourseSchedule> courseSchedules = courseScheduleRepo.findAll();
        for (CourseSchedule cs : courseSchedules) {
            if (cs.getId().equals(lessonId)) {
                cs.setTeacher(userRepo.findById(teacherId));
                cs.setOccurDate(occurDate);
                cs.setStatus(stas);
                courseScheduleRepo.save(cs);
                break;
            }
        }
        return "redirect:";
    }
}
