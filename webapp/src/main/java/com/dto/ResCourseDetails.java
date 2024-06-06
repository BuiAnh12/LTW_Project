package com.dto;
import java.util.List;
import lombok.*;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResCourseDetails {
	private Long courseId;
	private String courseName;
	private String description;
	private List<LessonDto> lessons;
}
