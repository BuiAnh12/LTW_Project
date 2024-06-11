package com.service; 
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.config.StaticUtilMethods;
import com.dto.AddGroupDto;
import com.dto.ResGroupDto;
import com.entity.Course;
import com.entity.Group;
import com.entity.User;

import lombok.RequiredArgsConstructor;
import com.repository.CourseRepository;
import com.repository.GroupRepo;
import com.repository.RegistrationRepository;
import com.repository.UserRepo;
@Service
@RequiredArgsConstructor
public class CategoryService {
	@Autowired
    private final StaticUtilMethods staticUtilMethods;
	@Autowired
	private final CourseRepository courseRepository;
	@Autowired
	private final GroupRepo groupRepo;
	@Autowired
	private final UserRepo userRepo;
	@Autowired
	private final RegistrationRepository registrationRepository;
	
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
    
    public ModelAndView getGroupListPage(HttpServletRequest request, Model model) {
        ModelAndView modelAndView = staticUtilMethods.customResponseModelView(request, model.asMap(), "group/group");
        List<ResGroupDto> groupDtoList = new ArrayList<>();
        List<Group> groupList = groupRepo.findAll();
        List<User> teacherList = userRepo.findAllTeacher();
        List<User> supervisorList = userRepo.findAllSupervisor();
        List<Course> courseList = courseRepository.findAll();
        for (Group group : groupList) {
        	String formatDescription = group.getFormat() ? "online" : "offline";
        	User teacher = userRepo.findOne(group.getMainTeacher().getId());
        	User supervisor = userRepo.findOne(group.getSupervisor().getId());
        	Course course = courseRepository.findOne(group.getCourse().getCourseId());     	
        	Long numOfStudent = registrationRepository.countByGroupId(group.getId());
        	ResGroupDto groupDto = ResGroupDto.builder()
        			.id(group.getId())
            		.title(group.getTitle())
            		.numOfStudent(numOfStudent)
            		.teacher(teacher.getName())
            		.supervisor(supervisor.getName())
            		.course(course.getCourseName())
            		.format(formatDescription)
            		.build();
            groupDtoList.add(groupDto);
        }
        modelAndView.addObject("groupList",groupDtoList);
        modelAndView.addObject("courseList",courseList);
        modelAndView.addObject("teacherList",teacherList);
        modelAndView.addObject("supervisorList",supervisorList);
        return modelAndView;
    }
}
