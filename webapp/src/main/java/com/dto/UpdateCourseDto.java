package com.dto;
import javax.validation.constraints.NotNull;

import java.util.List;
import lombok.*;
import lombok.Builder;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UpdateCourseDto {
	@NotNull(message = "error_entity_03")
	
	private String courseName;
	
    private String description;
    
    private List<LessonDto> lessons;
}
