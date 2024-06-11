package com.controller;

import java.util.NoSuchElementException;
import com.dto.*;

//import java.util.Set;

import javax.servlet.http.HttpServletRequest;
//import javax.validation.ConstraintViolation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.AddCourseDto;
import com.service.CourseService;

import lombok.RequiredArgsConstructor;
//import javax.validation.Validator;

@Controller
@RequiredArgsConstructor
public class CourseController {
	
	
	@Autowired
	private final CourseService courseService;
	
	@RequestMapping(value = "/manager/add-course", method = RequestMethod.POST)
    public String addCourse(
        @ModelAttribute("courseObject") AddCourseDto courseObject,
        HttpServletRequest request,
        RedirectAttributes redirectAttributes
    ) {
		final String redirectedUrl = "/category/course";
		System.out.println("THIS SHIT RUNNING");
        try {
            courseService.addCourse(courseObject);
            redirectAttributes.addFlashAttribute("succeedCode", "succeed_add_01");
        } catch (DuplicateKeyException e) {
            redirectAttributes.addFlashAttribute("courseObject", courseObject);
            redirectAttributes.addFlashAttribute("errorCode", e.getMessage());
        } catch (Exception ignored) {
            redirectAttributes.addFlashAttribute("courseObject", courseObject);
            redirectAttributes.addFlashAttribute("errorCode", "error_systemApplication_01");
        }
        return "redirect:" + redirectedUrl;
    }
	
	@RequestMapping(value = "/manager/course-list-active-btn", method = RequestMethod.POST)
	public String deleteCourse(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes
			) {
				final String redirectedUrl = "/category/course";
				try {
					courseService.deleteCourse(request);
					//redirectAttributes.addFlashAttribute("succeedCode", "succeed_delete_01");
				} catch (NumberFormatException | NoSuchElementException e) {
		            redirectAttributes.addFlashAttribute("errorCode", "error_entity_01");
		        } catch (Exception e) {
		            redirectAttributes.addFlashAttribute("errorCode", "error_entity_02");
		        }
				System.out.println("redirect:" + redirectedUrl);
		        return "redirect:" + redirectedUrl;
			}
	
	@RequestMapping(value = "/manager/update-course", method = RequestMethod.POST)
	public String updateCourse(
			@ModelAttribute("courseObject") UpdateCourseDto courseObject,
			HttpServletRequest request,
			RedirectAttributes redirectAttributes	
			) {
			final String redirectedUrl = "/category/course";
			System.out.println("here0"+ courseObject.getLessons());
	      try {
	          courseService.updateCourse(courseObject,request);
	          redirectAttributes.addFlashAttribute("succeedCode", "succeed_add_01");
	      } catch (DuplicateKeyException e) {
	          redirectAttributes.addFlashAttribute("courseObject", courseObject);
	          redirectAttributes.addFlashAttribute("errorCode", e.getMessage());
	      } catch (Exception ignored) {
	          redirectAttributes.addFlashAttribute("courseObject", courseObject);
	          redirectAttributes.addFlashAttribute("errorCode", "error_systemApplication_01");
	      }
	      return "redirect:" + redirectedUrl;
		}
}
