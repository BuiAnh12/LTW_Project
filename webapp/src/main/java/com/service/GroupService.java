package com.service;

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

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GroupService {
	@Autowired
	private final GroupRepo groupRepo;
	@Autowired
	private final UserRepo userRepo;
	@Autowired
	private final CourseRepository courseRepository;
	
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
}
