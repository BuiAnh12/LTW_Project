package com.service;
import com.dto.*;
import com.entity.*;

import java.util.ArrayList;
import java.util.List;

import javax.swing.ListModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repository.CourseScheduleRepo;

@Service
public class GroupService {
	@Autowired 
	CourseScheduleRepo courseScheduleRepo;
	
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
	
	
	
}
