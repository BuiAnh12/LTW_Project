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
	private String title;
	private String note;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	
	private String teacher;
	private String course;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	
	private String supervisor;
	
	private Integer status;
}
