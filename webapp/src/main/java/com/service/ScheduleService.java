package com.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.dto.ScheduleDTO;
import com.entity.Course;
import com.entity.CourseSchedule;
import com.entity.Group;
import com.entity.Lesson;
import com.entity.User;
import com.model.StudentTable;
import com.repository.CourseScheduleRepo;
import com.repository.GroupRepo;
import com.repository.UserRepo;

@Service
public class ScheduleService {

	@Autowired
    private CourseScheduleRepo courseScheduleRepo;
	
	public ScheduleDTO convert(CourseSchedule input) {
		return ScheduleDTO.builder()
				.id(input.getId())
				.nextLesson(input.getLesson().getDetail())
				.courseId(input.getGroup().getCourse().getCourseId())
				.courseName(input.getGroup().getCourse().getCourseName())
				.format(input.getGroup().getFormat() ? "Online" : "Offline")
				.groupId(input.getGroup().getId())
				.groupTitle(input.getGroup().getTitle())
				.groupDetail(input.getGroup().getGroupDetail())
				.occurDate(input.getOccurDate().toString())
				.teacherId(input.getTeacher().getId())
				.teacherName(input.getTeacher().getName())
				.build();
	}

	public Page<ScheduleDTO> getSchedulesWithinDateRange(Date startDate, Date endDate, String nextLesson, String courseName,
        String groupTitle, String teacherName, String format, Pageable pageable ) {
		List<CourseSchedule> courseSchedules = courseScheduleRepo.findByOccurDateBetween(startDate, endDate);
		List<ScheduleDTO> result = courseSchedules.stream()
		.map(this::convert)
		.collect(Collectors.toList());
		System.out.println("THIS SHIT GOT RELOADED");
		
		List<ScheduleDTO> filteredResult = new ArrayList<>();
		
		for (ScheduleDTO filterDto : result) {
			if (!isNullOrEmpty(nextLesson) && !filterDto.getNextLesson().toLowerCase().contains(nextLesson.toLowerCase())) {
				System.out.println("Trigger1");
				continue;
			}
			if (!isNullOrEmpty(courseName) && !filterDto.getCourseName().toLowerCase().contains(courseName.toLowerCase())) {
				System.out.println("Trigger2");
				continue;
			}
			if (!isNullOrEmpty(groupTitle) && !filterDto.getGroupTitle().toLowerCase().contains(groupTitle.toLowerCase())) {	
				System.out.println("Trigger3");
				continue;
			}
			if (!isNullOrEmpty(teacherName) && !filterDto.getTeacherName().toLowerCase().contains(teacherName.toLowerCase())) {
				System.out.println("Trigger4");
				continue;
			}
			if (!isNullOrEmpty(format) && !filterDto.getFormat().toLowerCase().contains(format.toLowerCase())) {
				System.out.println("Trigger5");
				continue;
			}
			filteredResult.add(filterDto);
		}
		int start = (int) pageable.getOffset();
		int end = Math.min((start + pageable.getPageSize()), filteredResult.size());
		List<ScheduleDTO> pagedResult = filteredResult.subList(start, end);
		
		return new PageImpl<>(pagedResult, pageable, filteredResult.size());
	}

	private boolean isNullOrEmpty(String str) {
		return str == null || str.isEmpty();
	}

    
    public List<ScheduleDTO> getAllSchedule() {
        List<CourseSchedule> courseSchedules = courseScheduleRepo.getAll();
        List<ScheduleDTO> result = courseSchedules.stream()
                .map(this::convert)
                .collect(Collectors.toList());
        return result;
    }
}
