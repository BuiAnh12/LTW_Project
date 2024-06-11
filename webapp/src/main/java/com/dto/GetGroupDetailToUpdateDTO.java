package com.dto;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetGroupDetailToUpdateDTO {
	String title;
	String note;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date startDate;
	String teacher;
	String course;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date endDate;
	String supervisor;
	Integer status;
}
