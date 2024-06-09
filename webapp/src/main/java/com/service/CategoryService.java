package com.service; 
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.config.StaticUtilMethods;
import com.entity.Course;

import lombok.RequiredArgsConstructor;
import com.repository.CourseRepository;
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
    
    public ModelAndView getCourseListPage(HttpServletRequest request, Model model) {
    	Pageable pageable = staticUtilMethods.createPageable(request);
        Page<Course> coursePage = courseRepository.findAll(pageable);

        ModelAndView modelAndView = staticUtilMethods.customResponseModelView(request, model.asMap(), "course/course");
        modelAndView.addObject("courseList", coursePage.getContent());
        modelAndView.addObject("currentPage", coursePage.getNumber() + 1);
        modelAndView.addObject("totalPages", coursePage.getTotalPages());

        return modelAndView;
    }
}
