package com.service;
import com.dto.*;
import com.entity.*;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.ListModel;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repository.CourseRepository;
import com.repository.CourseScheduleRepo;
import com.repository.GroupRepo;
import com.repository.RegistrationRepository;
import com.repository.UserRepo;

@Service
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
		  try {
		        String groupId = request.getParameter("groupId");
		        
		        Long mainTeacherId = userRepo.findIdByName(getGroupDetailToUpdateDTO.getTeacher());
		        User mainTeacher = userRepo.findOne(mainTeacherId);
		        
		        Long supervisorId = userRepo.findIdByName(getGroupDetailToUpdateDTO.getSupervisor());
		        User supervisorUser = userRepo.findOne(supervisorId);
		        
		        Long courseId = courseRepository.findIdByCourseName(getGroupDetailToUpdateDTO.getCourse());
		        Course course = courseRepository.findOne(courseId);  
		        
		        Group group = groupRepo.findOne(Integer.parseInt(groupId));
		        
		        group.setTitle(getGroupDetailToUpdateDTO.getTitle());
		        group.setGroupDetail(getGroupDetailToUpdateDTO.getNote());
		        group.setStartDate(getGroupDetailToUpdateDTO.getStartDate());
		        group.setEndDate(getGroupDetailToUpdateDTO.getEndDate());
		        group.setMainTeacher(mainTeacher);
		        group.setSupervisor(supervisorUser);
		        group.setCourse(course);
		        group.setStatus(getGroupDetailToUpdateDTO.getStatus());
		        groupRepo.save(group);
		    } catch (Exception e) {
		        // Handle the exception, rollback transaction, log, or perform any necessary actions.
		        // For example:
		        e.printStackTrace();
		        // You may also throw a custom exception or rethrow the original exception.
		        // throw new CustomException("An error occurred while updating group detail", e);
		    }
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
