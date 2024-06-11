package com.controller;


import javax.servlet.http.HttpServletRequest;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.awt.print.Printable;
import java.io.IOException;
import java.io.PrintWriter;
//import java.sql.Date;
import java.util.List;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.dto.AddCourseDto;
import com.dto.AddGroupDto;
import com.entity.Group;
import com.service.GroupService;

import lombok.RequiredArgsConstructor;

import com.dto.ResGroupDetailDto;
import com.dto.GetGroupDetailToUpdateDTO;
import com.dto.userDetailDTO;
import com.entity.CourseSchedule;
import com.entity.Registration;
import com.entity.User;
import com.google.protobuf.TextFormat.ParseException;
import com.repository.CourseScheduleRepo;
import com.repository.GroupRepo;
import com.repository.RegistrationRepository;
import com.repository.UserRepo;
import com.service.GroupService;
import com.service.StudentService;
import com.service.UserService;

import lombok.Data;


@Controller
@RequiredArgsConstructor
public class GroupController {
	@Autowired
    private RegistrationRepository registrationRepository;
	
	@Autowired
	private CourseScheduleRepo courseScheduleRepo;
	
  @Autowired
	private UserRepo userRepo;
	@Autowired 
	private final GroupService groupService;
  
  @RequestMapping(value = "/manager/add-group", method = RequestMethod.POST)
    public String addGroup(
        @ModelAttribute("groupObject") AddGroupDto groupObject,
        HttpServletRequest request,
        RedirectAttributes redirectAttributes
    ) {
		final String redirectedUrl = "/category/group";
		System.out.println("THIS SHIT RUNNING" + groupObject.getTitle());

        try {
            groupService.addGroup(groupObject);
            redirectAttributes.addFlashAttribute("succeedCode", "succeed_add_01");
        } catch (DuplicateKeyException e) {
            redirectAttributes.addFlashAttribute("groupObject", groupObject);
            redirectAttributes.addFlashAttribute("errorCode", e.getMessage());
        } catch (Exception ignored) {
            redirectAttributes.addFlashAttribute("groupObject", groupObject);
            redirectAttributes.addFlashAttribute("errorCode", "error_systemApplication_01");
        }
        return "redirect:" + redirectedUrl;
    }   
  
    @GetMapping("/group/delete-student")
    public String deleteStudent(@RequestParam Long studentId,
    		@RequestParam  Integer groupId,
    		@RequestHeader(value = "referer", required = false) String referer) {
        // Add logic to delete the student by ID
    	System.out.println("GROUPID: " + groupId);
    	List<Registration> registrations = registrationRepository.findAll();
    	for (Registration registration : registrations) {
    		if (registration.getStudent().getId() == studentId && registration.getGroup().getId() == groupId) {
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
    
    @RequestMapping(value = "/updateGroupdetail" ,method = RequestMethod.POST)
    public String updateGroupDetail(@ModelAttribute("groupObject")  GetGroupDetailToUpdateDTO resGroupDetailDto, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
    	String groupId=request.getParameter("groupId");
    	final String redirectedUrl = "/category/group"; 	
    	try {
			groupService.updateGroupDetai(request, resGroupDetailDto);
			System.out.println("Da thuc hien xong update");
			redirectAttributes.addFlashAttribute("succeedCode", "succeed_add_01");
		} catch (DuplicateKeyException e) {
			redirectAttributes.addFlashAttribute("courseObject", resGroupDetailDto);
			redirectAttributes.addFlashAttribute("errorCode", e.getMessage());
		} catch (Exception ignored) {
			redirectAttributes.addFlashAttribute("courseObject", resGroupDetailDto);
			redirectAttributes.addFlashAttribute("errorCode", "error_systemApplication_01");
		}	
    	return "redirect:" + redirectedUrl;
    }
    
    @RequestMapping(value = "/deleteGroup",method = RequestMethod.POST)
	@Transactional(rollbackOn = { Exception.class })
	public void deleteGroup(HttpServletRequest request,HttpServletResponse response) throws IOException {
    	Integer groupId = Integer.parseInt(request.getParameter("groupId"));
        if (!registrationRepository.findStudentsByGroupId(groupId).isEmpty()) {
            // Display dialog
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('This Group was registrated by Student !Can't Delete ');");
            out.println("</script>");
        } else {
            groupService.deleteGroupDetail(request);
        }
	}
    

}
