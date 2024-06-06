package com.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.ScheduleDTO;
import com.entity.Course;
import com.entity.CourseSchedule;
import com.entity.Group;
import com.entity.Lesson;
import com.entity.User;
import com.repository.CourseScheduleRepo;
import com.repository.GroupRepo;
import com.repository.UserRepo;

@Service
public class ScheduleService {

	@Autowired
    private CourseScheduleRepo courseScheduleRepo;
	
	public ScheduleDTO convert(CourseSchedule input) {
		ScheduleDTO output = new ScheduleDTO();
		output.setId(input.getId());
		output.setCourseId(input.getGroup().getCourse().getCourseId());
		output.setCourseName(input.getGroup().getCourse().getCourseName());
		output.setFormat(input.getGroup().getFormat() ? "Online" : "Offline");
		output.setGroupId(input.getGroup().getId());
		output.setGroupTitle(input.getGroup().getGroupDetail());
		output.setLessonId(input.getLesson().getLessonId());
		output.setNextLesson(input.getLesson().getDetail());
		output.setOccurDate(input.getOccurDate().toString());
		output.setTeacherId(input.getTeacher().getId());
		output.setTeacherName(input.getTeacher().getName());
		return output;
	}

    public List<ScheduleDTO> getSchedulesWithinDateRange(LocalDate startDate, LocalDate endDate) {
    	List<CourseSchedule> courseSchedules = courseScheduleRepo.findByOccurDateBetween(startDate, endDate);
    	List<ScheduleDTO> result = courseSchedules.stream()
                .map(this::convert)
                .collect(Collectors.toList());
        return result;
    }
    
    public List<ScheduleDTO> getAllSchedule() {
        List<CourseSchedule> courseSchedules = courseScheduleRepo.getAll();
        List<ScheduleDTO> result = courseSchedules.stream()
                .map(this::convert)
                .collect(Collectors.toList());
        return result;
    }
}
