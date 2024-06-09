package com.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.config.StaticUtilMethods;
import com.dto.AddCourseDto;
import com.dto.LessonDto;
import com.repository.AccountRepo;
import com.repository.CourseRepository;
import com.repository.LessonRepository;
import com.repository.UserRepo;

import lombok.Builder;
import lombok.RequiredArgsConstructor;

import com.entity.Account;
import com.entity.Course;
import com.entity.User;
import com.dto.ResCourseDetails;
import com.dto.accountDTO;
import com.dto.userDetailDTO;

@Service
@RequiredArgsConstructor
public class SubpageService {
	@Autowired
	private final StaticUtilMethods staticUtilMethods;
	@Autowired
	private final CourseRepository courseRepository;
	@Autowired
	private final LessonRepository lessonRepository;
	@Autowired
	private final UserRepo userRepo;
	@Autowired
	private final AccountRepo accountRepo;

	public ModelAndView getAddCoursePage(HttpServletRequest request, Model model) {
		ModelAndView modelAndView = staticUtilMethods.customResponseModelView(request, model.asMap(),
				"/course/addCourse/addCourse");
		AddCourseDto courseObject = (AddCourseDto) model.asMap().get("courseObject");
		if (courseObject != null)
			modelAndView.addObject(courseObject);
		return modelAndView;
	}

	public ModelAndView getAddUserPage(HttpServletRequest request, Model model) {
		ModelAndView modelAndView = staticUtilMethods.customResponseModelView(request, model.asMap(),
				"user/subView/addNewUser");
		userDetailDTO userdetail = (userDetailDTO) model.asMap().get("userObject");

		if (userdetail != null) {
			modelAndView.addObject(userdetail);
		}
		return modelAndView;
	}

	public ModelAndView getDetailsPage(HttpServletRequest request) {
		final String courseIdStr = request.getParameter("courseId");
		ModelAndView modelAndView = new ModelAndView("/course/detailsCourse/detailsCourse");

		if (courseIdStr == null) {
			throw new IllegalArgumentException("courseId is null");
		}

		try {
			Long courseId = Long.parseLong(courseIdStr);

			Course course = courseRepository.findOne(courseId);
			if (course == null) {
				throw new IllegalArgumentException("Course not found for id: " + courseId);
			}

			List<LessonDto> lessons = lessonRepository.findAllLessonByCourseId(courseId);
			if (lessons == null) {
				lessons = new ArrayList<>();
			}
			ResCourseDetails courseDetails = ResCourseDetails.builder().courseId(course.getCourseId())
					.courseName(course.getCourseName()).description(course.getDescription()).lessons(lessons).build();
			modelAndView.addObject("courseObject", courseDetails);
		} catch (NumberFormatException e) {
			throw new IllegalArgumentException("Invalid courseId: " + courseIdStr, e);
		} catch (Exception e) {
			// Log the exception and rethrow or handle it accordingly
			throw new RuntimeException("Error retrieving course details", e);
		}
		return modelAndView;
	}

	public ModelAndView getUserDetailPage(HttpServletRequest request) {
		final String userIdString=request.getParameter("userid");
		ModelAndView modelAndView = new ModelAndView("user/subView/userDetail");
		if(userIdString==null) {
			  throw new IllegalArgumentException("userId is null");
		}
		try {
			//write code here
			Long userId=Long.parseLong(userIdString);
			User user = userRepo.findOne(userId);
			
			if(user ==null) {
				  throw new IllegalArgumentException("User not found for id: " + userId);
			}
			System.out.println("Da lay duoc user:"+user.getName());
			System.out.println("Da chay den SubpageService");
			
			accountDTO newAccount=accountRepo.findAccountByUserId(userId);
			
			userDetailDTO tmpUser = userDetailDTO.builder()
                    .userId(user.getId())
                    .userName(user.getName())
                    .userEmail(user.getEmail())
                    .userPhone(user.getPhone())
                    .userRole(user.getRole())
                    .accountDto(newAccount)
                    .build();

			System.out.println("Thong tin Account username trong subpage:"+newAccount.getAccountUsername());
			modelAndView.addObject("userObject",tmpUser);
			
		}catch (NumberFormatException e) {
			throw new IllegalArgumentException("Invalid userId: " + userIdString, e);
		}catch (Exception e) {
			throw new RuntimeException("Error retrieving User details", e);
		}
		return modelAndView;
	}
}
