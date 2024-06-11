package com.service; 
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.config.StaticUtilMethods;
import com.entity.Group;
import com.entity.Student;
import com.model.DashboardModel;

import lombok.RequiredArgsConstructor;
import com.repository.CourseRepository;
import com.repository.GroupRepo;
import com.repository.StudentRepo;
import com.repository.UserRepo;
@Service
@RequiredArgsConstructor
public class DashboardService {
	@Autowired
    private final StaticUtilMethods staticUtilMethods;
	
	@Autowired
	private final CourseRepository courseRepo;
	@Autowired
	private final StudentRepo studentRepo;
	@Autowired
	private final UserRepo userRepo;
	@Autowired
	private final GroupRepo groupRepo;
	
	public DashboardModel getModel() {
		
		long onlineStudent = studentRepo.numberOnlStudent();
		long offlineStudent = studentRepo.numberOffStudent();
		
		long onlineGroup = groupRepo.numberOnlGroup();
		long offlineGroup = groupRepo.numberOffGroup();
		
		long activeCourse = courseRepo.getActiveCourse();
		
		Long userNumber = userRepo.numberOfAdmin();
		Long teacherNumber = userRepo.numberOfTeacher();
//		long onlineStudent = 2;
//		long offlineStudent = 2;
//		
//		long onlineGroup = 2;
//		long offlineGroup = 2;
//		
//		long activeCourse = 2;
//		
//		long userNumber = 12;
//		long teacherNumber = 24;
		
		DashboardModel dashboardModel 
		= new DashboardModel(
				onlineStudent, 
				offlineStudent, 
				onlineGroup, 
				offlineGroup, 
				activeCourse, 
				userNumber, 
				teacherNumber
				);
		return dashboardModel;
	}
	
	public List<Group> getGroup(){
		Date currentDate = new Date();
		Calendar calendar = Calendar.getInstance();
        // Set the calendar to the current date
        calendar.setTime(currentDate);

        // Subtract 30 days from the current date
        calendar.add(Calendar.DAY_OF_MONTH, 30);
        Date endDate = calendar.getTime();
        List<Group> result = groupRepo.recentGroup(currentDate,endDate);
        return result;
	}
	
	public List<Integer> getNoStudent(List<Group> groups){
		List<Integer> result = new ArrayList<>();
		for (Group group : groups) {
			Integer tmp = Integer.valueOf(groupRepo.getNoStudent(group.getId()));
			result.add(tmp);
		}
		return result;
		
	}
	
}