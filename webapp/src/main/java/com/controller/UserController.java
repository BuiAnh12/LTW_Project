package com.controller;

import java.io.IOException;
import java.util.NoSuchElementException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.AddCourseDto;
import com.dto.UpdateCourseDto;
import com.dto.userDetailDTO;
import com.entity.User;
import com.repository.AccountRepo;
import com.repository.UserRepo;
import com.service.UserService;

import lombok.Data;

@Controller
@Data
public class UserController {

	@Autowired
	private final UserService userService;
	@Autowired
	private final UserRepo userRepo;
	@Autowired
	private final AccountRepo accountRepo;

	@RequestMapping(value = "manager/addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("userObject") userDetailDTO userdetaildto, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		final String reDirectString = "/category/user";
		try {
			userService.addUser(userdetaildto);
			redirectAttributes.addFlashAttribute("succeedCode", "succeed_add_01");
		} catch (DuplicateKeyException e) {
			redirectAttributes.addFlashAttribute("accountObject", userdetaildto);
			redirectAttributes.addFlashAttribute("errorCode", e.getMessage());
		} catch (Exception ignored) {
			redirectAttributes.addFlashAttribute("accountObject", userdetaildto);
			redirectAttributes.addFlashAttribute("errorCode", "error_systemApplication_01");
		}
		return "redirect:" + reDirectString;
	}

	@RequestMapping(value = "manager/userupdate", method = RequestMethod.POST)
	public String updateCourse(@ModelAttribute("userObject") userDetailDTO userDTO, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		final String redirectedUrl = "/category/user";
		System.out.println("update in controller ");
		try {
			userService.updateUser(userDTO, request);
			System.out.println("Da thuc hien xong update");
			redirectAttributes.addFlashAttribute("succeedCode", "succeed_add_01");
		} catch (DuplicateKeyException e) {
			redirectAttributes.addFlashAttribute("courseObject", userDTO);
			redirectAttributes.addFlashAttribute("errorCode", e.getMessage());
		} catch (Exception ignored) {
			redirectAttributes.addFlashAttribute("courseObject", userDTO);
			redirectAttributes.addFlashAttribute("errorCode", "error_systemApplication_01");
		}
		return "redirect:" + redirectedUrl;
	}
	@RequestMapping(value = "manager/deleteuser",method = RequestMethod.POST)
	@Transactional(rollbackOn = { Exception.class })
	public void deleteUser(HttpServletRequest request,HttpServletResponse response) throws IOException {
		 System.out.println("i'm svc");
	        Long userid = Long.parseLong(request.getParameter("userId"));
	        User tmp = userRepo.findOne(userid);

	        if (!userRepo.exists(userid)) {
	            response.sendError(HttpServletResponse.SC_NOT_FOUND, "User ID not found!");
	            return;
	        }
	        userRepo.delete(userid);
	        accountRepo.delete(tmp.getAccount().getId());
	        System.out.println("done");
//	        response.setStatus(HttpServletResponse.SC_OK);
		
	}
	 
}
