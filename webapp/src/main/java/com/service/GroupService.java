package com.service;

import com.dto.*;
import com.entity.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.ListModel;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.dto.AddCourseDto;
import com.dto.AddGroupDto;
import com.entity.Course;
import com.entity.Group;
import com.entity.Lesson;
import com.entity.User;
import com.repository.CourseRepository;
import com.repository.GroupRepo;
import com.repository.LessonRepository;
import com.repository.UserRepo;
import com.repository.CourseRepository;
import com.repository.CourseScheduleRepo;
import com.repository.GroupRepo;
import com.repository.RegistrationRepository;
import com.repository.UserRepo;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GroupService {
	@Autowired 
	CourseScheduleRepo courseScheduleRepo;
	@Autowired
	private GroupRepo groupRepo;
	@Autowired
	private UserRepo userRepo;
	@Autowired 
	private  CourseRepository courseRepository;
	@Autowired
	private RegistrationRepository registrationRepository;
  
  	@Transactional(rollbackOn = {Exception.class})
	public void addGroup(AddGroupDto groupObject) {
		Course course = courseRepository.findOne(groupObject.getCourseId());
		User teacher = userRepo.findOne(groupObject.getTeacherId());
		User supervisor = userRepo.findOne(groupObject.getSupervisorId()); 
		Group group = Group.builder()
				.title(groupObject.getTitle())
				.groupDetail(groupObject.getNote())
				.startDate(groupObject.getStartDate())
				.endDate(groupObject.getEndDate())
				.course(course)
				.mainTeacher(teacher)
				.supervisor(supervisor)
				.format(true)
				.status(1)
				.build();
		groupRepo.save(group);	
	}
	
	List<courseScheduleDTO> getCSList(Integer groupId){
		List<CourseSchedule> csList = courseScheduleRepo.getByGroupId(groupId);
		List<courseScheduleDTO> result = new ArrayList<>();
		for (CourseSchedule cs : csList) {
			
			result.add(courseScheduleDTO.builder()
					.id(cs.getId())
					.group(cs.getGroup())
					.lesson(cs.getLesson())
					.occurDate(cs.getOccurDate())
					.status(cs.getStatus())
					.teacher(cs.getTeacher()).build());
		}
		return result;
	}
	
	@Transactional(rollbackOn = { Exception.class })
	public void updateGroupDetai(HttpServletRequest request ,GetGroupDetailToUpdateDTO getGroupDetailToUpdateDTO) {
		        
		        User mainTeacher = userRepo.findOne(Long.parseLong(getGroupDetailToUpdateDTO.getTeacher()));
		        System.out.println("Main teacher da duoc tim thay: "+mainTeacher.getName());
		        System.out.println("mainTeacherud:" +mainTeacher.getId());
		        
//		        Long supervisorId = userRepo.findIdByName(getGroupDetailToUpdateDTO.getSupervisor());
//		        User supervisorUser = userRepo.findOne(supervisorId);
		        User supervisorUser = userRepo.findOne(Long.parseLong(getGroupDetailToUpdateDTO.getSupervisor()));
		        System.out.println("Main supervisor da duoc tim thay: "+supervisorUser.getName());
		        
		        System.out.println("supervisorId:" +supervisorUser.getId());
		        
//		        Long courseId = courseRepository.findIdByCourseName(getGroupDetailToUpdateDTO.getCourse());
//		        Course course = courseRepository.findOne(courseId);  
		        Course course = courseRepository.findOne(Long.parseLong(getGroupDetailToUpdateDTO.getCourse()));  
//		        User supervisorUser = userRepo.findOne(Long.parseLong(getGroupDetailToUpdateDTO.getCourse()));
		        System.out.println("Course da duoc tim thay: "+course.getCourseName());
		        System.out.println("Cousre :"+course.getCourseName());
		        
		        String groupId=request.getParameter("groupId");
		        System.out.println("groupId can update la :"+groupId);
		        Group group = groupRepo.findOne(Integer.parseInt(groupId));
		        System.out.println("Group id da duoc tim thay la: "+group.getId());
		        System.out.println("Status dc select:"+getGroupDetailToUpdateDTO.getStatus());
		        Integer statusInteger=getGroupDetailToUpdateDTO.getStatus();
//		        Integer statuInteger=getGroupDetailToUpdateDTO.getStatus();
//		        
//		        String titleString=getGroupDetailToUpdateDTO.getTitle();
////		        
////		        Date enDate=getGroupDetailToUpdateDTO.getEndDate());
//		        
//		        java.util.Date staDate = getGroupDetailToUpdateDTO.getStartDate();	
//		        java.util.Date enDate = getGroupDetailToUpdateDTO.getEndDate();	
//		        try {
//		        	  java.sql.Date sqlstDate = new java.sql.Date(staDate.getTime());
//				        java.sql.Date sqlenDate = new java.sql.Date(enDate.getTime());
//				} catch (Exception e) {
//					// TODO: handle exception
//				}
//		        String title=getGroupDetailToUpdateDTO.getTitle();
//		        String note=getGroupDetailToUpdateDTO.getNote();
//		        groupRepo.updateGroupById(Integer.parseInt(groupId), course, mainTeacher, enDate, enDate, supervisorUser, titleString, statuInteger, title, groupId);
//		        
		        group.setTitle(getGroupDetailToUpdateDTO.getTitle());
		        System.out.println("Da chay xong tittle");
		        group.setGroupDetail(getGroupDetailToUpdateDTO.getNote());
		        System.out.println("da chay xong note");
		        group.setStartDate(getGroupDetailToUpdateDTO.getStartDate());
		        System.out.println("da chay xong Startdate");
		        group.setEndDate(getGroupDetailToUpdateDTO.getEndDate());
		        System.out.println("da chay xong eddate");
		        group.setMainTeacher(mainTeacher);
		        System.out.println("da chay xong mainteacher");
		        group.setSupervisor(supervisorUser);
		        System.out.println("da chay xong supervisor");
		        group.setCourse(course);
		        System.out.println("da chay xong course");
		        group.setStatus(statusInteger);
		        System.out.println(group.getCourse());
				groupRepo.save(group);
				System.out.println(group.getCourse());
				System.out.println("im here");
	}
	@Transactional(rollbackOn = { Exception.class })
	public void deleteGroupDetail(HttpServletRequest request) {
		try {
	        Integer groupId = Integer.parseInt(request.getParameter("groupId"));
	        
	        registrationRepository.deleteByGroupId(groupId);
	        courseScheduleRepo.deleteByGroupId(groupId);
	        groupRepo.delete(groupId);
	    } catch (Exception e) {
	        e.printStackTrace();;
	    }
		
	}
	
}
