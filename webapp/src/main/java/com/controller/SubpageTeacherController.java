package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.NoSuchElementException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.service.SubpageService;
import com.service.TeacherSubpageService;

import lombok.RequiredArgsConstructor;
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "teachersubpage")
public class SubpageTeacherController {
	@Autowired
	private final TeacherSubpageService teacherSubpageService;
	@RequestMapping(value = "/add-course", method = RequestMethod.GET)
	public ModelAndView getAddCoursePageAndView(HttpServletRequest request, Model model) {
		return teacherSubpageService.getAddCoursePage(request, model);
	}
	
	@PostMapping("/addToGroup")
    public String addToGroup(@RequestParam List<Long> selectedStudentIds, 
    		@RequestParam Long groupId,
    		@RequestHeader(value = "referer", required = false) String referer) {
		
        // Handle the selected student IDs
        for (Long studentId : selectedStudentIds) {
            // Add student to group based on the ID
            System.out.println("Adding student with ID: " + studentId + " to the group " + groupId);
            teacherSubpageService.addStudentToCourse(studentId, groupId);
        }

        	
        return referer != null ? "redirect:" + referer : "redirect:/defaultPage";
    }
	
	@RequestMapping(value = "/details-course", method = RequestMethod.GET)
	public ModelAndView getDetailsPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		final String redirectedUrl = "/teacher/course";
		
        try {
        	ModelAndView modelAndView = teacherSubpageService.getDetailsPage(request);
			return modelAndView;
		} catch (NullPointerException ignored) {
            response.sendRedirect(redirectedUrl);
        } catch (NoSuchElementException ignored) {
            request.getSession().setAttribute("errorCode", "error_entity_01");
            response.sendRedirect(redirectedUrl);
        } catch (Exception ignored) {
            request.getSession().setAttribute("errorCode", "error_systemApplication_01");
            response.sendRedirect(redirectedUrl);
        }
		return null;	
	}
	/* USER */
	@RequestMapping(value = "addUser",method =RequestMethod.GET)
	public ModelAndView getAddUserPageandView(HttpServletRequest request,Model model) {
		return teacherSubpageService.getAddUserPage(request, model);
	}
	@RequestMapping(value = "userdetail" , method = RequestMethod.GET)
	public ModelAndView getuserDetailPage(HttpServletRequest request, HttpServletResponse response)throws IOException{
		final String redirectedUrl="/category/user";
		 try {
	        	ModelAndView modelAndView = teacherSubpageService.getUserDetailPage(request);
				return modelAndView;
			} catch (NullPointerException ignored) {
	            response.sendRedirect(redirectedUrl);
	        } catch (NoSuchElementException ignored) {
	            request.getSession().setAttribute("errorCode", "error_entity_01");
	        } catch (Exception ignored) {
	            request.getSession().setAttribute("errorCode", "error_systemApplication_01");
	        }
			return null;		
	}
	
	@RequestMapping(value = "/group-detail", method = RequestMethod.GET)
	public ModelAndView getDetailGroup(HttpServletRequest request, HttpServletResponse response) throws IOException {
		final String redirectedUrl = "/teacher/group";	
        try {
        	ModelAndView modelAndView = teacherSubpageService.getDetailGroup(request);
			return modelAndView;
		} catch (NullPointerException ignored) {
            response.sendRedirect(redirectedUrl);
        } catch (NoSuchElementException ignored) {
            request.getSession().setAttribute("errorCode", "error_entity_01");
            response.sendRedirect(redirectedUrl);
        } catch (Exception ignored) {
            request.getSession().setAttribute("errorCode", "error_systemApplication_01");
            response.sendRedirect(redirectedUrl);
        }
		return null;	
	}
	
}
