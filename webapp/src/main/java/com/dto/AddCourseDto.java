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
public class AddCourseDto {
	@NotNull(message = "error_entity_03")
	private String courseName;
	
    private String description;
    
    private List<String> lessons;
}
