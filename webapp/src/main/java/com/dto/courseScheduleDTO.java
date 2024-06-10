package com.dto;

import java.util.Date;



import com.entity.Group;
import com.entity.Lesson;
import com.entity.User;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class courseScheduleDTO {

	    private Long id;

	    private Group group;

	    private Lesson lesson;

	    private Date occurDate;

	    private Boolean status;

	    private User teacher;
	    
}
