package com.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class ScheduleDTO {
    private Long id;
	private String occurDate;
    private Long lessonId;
    private String nextLesson;
    private Long courseId;
    private String courseName;
    private int groupId;
    private String groupTitle;
    private String groupDetail;
    private Long teacherId;
    private String teacherName;
    private String format;
   

    
}
