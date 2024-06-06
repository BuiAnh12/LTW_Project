package com.dto;

import javax.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LessonDto {
	@NotBlank(message = "error_entity_03")
	String nameLesson;
}
