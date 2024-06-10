package com.service; 
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import java.util.ArrayList;
import java.util.List;
import org.springframework.security.authentication.DisabledException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.taglibs.standard.lang.jstl.AndOperator;
import org.hibernate.annotations.NaturalId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.config.StaticUtilMethods;
import com.dto.ResGroupDto;
import com.entity.Course;
import com.entity.Group;
import com.entity.Student;
import com.entity.User;
import com.model.StudentTable;
import lombok.RequiredArgsConstructor;
import com.repository.CourseRepository;
import com.repository.GroupRepo;
import com.repository.RegistrationRepository;
import com.repository.StudentRepo;
import com.repository.UserRepo;
import org.springframework.data.domain.PageImpl;

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
	@Autowired
	private final StudentRepo studentRepo;
	
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

    private boolean isNullOrEmpty(String str) {
		return str == null || str.isEmpty();
	}


}

