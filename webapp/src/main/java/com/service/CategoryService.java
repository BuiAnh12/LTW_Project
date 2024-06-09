package com.service; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.config.StaticUtilMethods;
import com.dto.accountDTO;
import com.dto.showMainViewUserDTO;

import lombok.RequiredArgsConstructor;

import com.repository.AccountRepo;
import com.repository.CourseRepository;
import com.repository.UserRepo;
@Service
@RequiredArgsConstructor
public class CategoryService {
	@Autowired
    private final StaticUtilMethods staticUtilMethods;
	@Autowired
	private final CourseRepository courseRepository;
	@Autowired
	private final UserRepo userRepo;
	@Autowired
	private final AccountRepo accountRepo;

	
    public ModelAndView getScheduleListPage(HttpServletRequest request, Model model) {
        ModelAndView modelAndView = staticUtilMethods.customResponseModelView(request, model.asMap(), "Schedule/schedule");
        // modelAndView.addObject("scheduleList", )
        return modelAndView;
    }
    
    public ModelAndView getCourseListPage(HttpServletRequest request, Model model) {
        ModelAndView modelAndView = staticUtilMethods.customResponseModelView(request, model.asMap(), "course/course");
        modelAndView.addObject("courseList", courseRepository.findAll());
        return modelAndView;
    }
    
    public ModelAndView getUserListPage(HttpServletRequest request, Model model) {
        ModelAndView modelAndView=staticUtilMethods.customResponseModelView(request,model.asMap(),"user/user");
        List<showMainViewUserDTO>user=userRepo.findUserAccountDetails();
        modelAndView.addObject("userList",user);
        return modelAndView;
    }
}
