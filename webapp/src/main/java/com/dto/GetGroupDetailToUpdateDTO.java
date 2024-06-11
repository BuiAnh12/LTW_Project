package com.dto;


import java.sql.Date;

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
	Date startDate;
	String teacher;
	String course;
	Date endDate;
	String supervisor;
	Integer status;
}
