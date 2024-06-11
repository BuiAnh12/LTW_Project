package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.AddCourseDto;
import com.dto.AddGroupDto;
import com.entity.Group;
import com.service.GroupService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class GroupController {
	
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
}
