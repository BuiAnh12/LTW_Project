package com.service; 
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.DisabledException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.taglibs.standard.lang.jstl.AndOperator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.config.StaticUtilMethods;
import com.entity.Course;
import com.model.StudentTable;

import lombok.RequiredArgsConstructor;
import com.repository.CourseRepository;
import org.springframework.data.domain.PageImpl;
@Service
@RequiredArgsConstructor
public class CategoryService {
	@Autowired
    private final StaticUtilMethods staticUtilMethods;
	@Autowired
	private final CourseRepository courseRepository;

	
    public ModelAndView getScheduleListPage(HttpServletRequest request, Model model) {
        ModelAndView modelAndView = staticUtilMethods.customResponseModelView(request, model.asMap(), "Schedule/schedule");
        // modelAndView.addObject("scheduleList", )
        return modelAndView;
    }
    
    public ModelAndView getCourseListPage(HttpServletRequest request, Model model, String courseName, String status) {
    	if(courseName == null && status == null) {
        	Pageable pageable = staticUtilMethods.createPageable(request);
            Page<Course> coursePage = courseRepository.findAll(pageable);
        	ModelAndView modelAndView = staticUtilMethods.customResponseModelView(request, model.asMap(), "course/course");
            modelAndView.addObject("courseList", coursePage.getContent());
            modelAndView.addObject("currentPage", coursePage.getNumber() + 1);
            modelAndView.addObject("totalPages", coursePage.getTotalPages());

            return modelAndView;
        }
    	else {
    		Pageable pageable = staticUtilMethods.createPageable(request);
            // Fetch all courses and filter them if courseName or status is provided
            Page<Course> coursePage = courseRepository.findAll(pageable);
            List<Course> filteredResult = new ArrayList<>();

            for (Course course : coursePage.getContent()) {
                if (!isNullOrEmpty(courseName) && !course.getCourseName().toLowerCase().contains(courseName.toLowerCase())) {
                    continue;
                }
                if (!isNullOrEmpty(status)) {
                	String stas = "";
                	if (course.isStatus()) {
						stas = "enable";
					}
                	else {
                		stas = "disable";
                	}
                	if (!stas.toLowerCase().contains(status.toLowerCase())) {
                		continue;
					}
                }
                filteredResult.add(course);
            }

            // Calculate the start and end indices for the current page
            int start = (int) pageable.getOffset();
            int end = Math.min((start + pageable.getPageSize()), filteredResult.size());
            List<Course> pagedResult = filteredResult.subList(start, end);

            // Create a Page object for the filtered and paged results
            Page<Course> filteredCoursePage = new PageImpl<>(pagedResult, pageable, filteredResult.size());

            ModelAndView modelAndView = staticUtilMethods.customResponseModelView(request, model.asMap(), "course/courseTable");
            modelAndView.addObject("courseList", filteredCoursePage.getContent());
            modelAndView.addObject("currentPage", filteredCoursePage.getNumber() + 1);
            modelAndView.addObject("totalPages", filteredCoursePage.getTotalPages());
            modelAndView.addObject("courseName",courseName);
            modelAndView.addObject("status",status);
            return modelAndView;
    	}
    }
    private boolean isNullOrEmpty(String str) {
		return str == null || str.isEmpty();
	}

}
