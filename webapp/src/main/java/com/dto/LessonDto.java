package com.dto;

import lombok.*;
import lombok.Builder;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LessonDto {
	String detail;
	Long lessonId;
	Boolean status;
}
