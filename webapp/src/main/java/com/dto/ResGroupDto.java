package com.dto;
import lombok.*;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResGroupDto {
	Integer id;
	String title;
	Long numOfStudent;
	String teacher;
	String supervisor;
	String course;
	String format;
}
