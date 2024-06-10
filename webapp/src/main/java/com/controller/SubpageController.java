package com.controller;

import java.io.IOException;

import java.util.NoSuchElementException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.service.SubpageService;

import lombok.RequiredArgsConstructor;
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "subpage")
public class SubpageController {
	@Autowired
	private final SubpageService subpageService;
	@RequestMapping(value = "/add-course", method = RequestMethod.GET)
	public ModelAndView getAddCoursePageAndView(HttpServletRequest request, Model model) {
		return subpageService.getAddCoursePage(request, model);
	}
	
	@RequestMapping(value = "/details-course", method = RequestMethod.GET)
	public ModelAndView getDetailsPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		final String redirectedUrl = "/category/course";
		
        try {
        	ModelAndView modelAndView = subpageService.getDetailsPage(request);
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
	@RequestMapping(value = "/addUser",method =RequestMethod.GET)
	public ModelAndView getAddUserPageandView(HttpServletRequest request,Model model) {
		return subpageService.getAddUserPage(request, model);
	}
	@RequestMapping(value = "userdetail" , method = RequestMethod.GET)
	public ModelAndView getuserDetailPage(HttpServletRequest request, HttpServletResponse response)throws IOException{
		final String redirectedUrl="/category/user";
		 try {
	        	ModelAndView modelAndView = subpageService.getUserDetailPage(request);
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
	
}
