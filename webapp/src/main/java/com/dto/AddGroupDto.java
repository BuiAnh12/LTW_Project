package com.dto;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AddGroupDto {
    private String title;
    private String note;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate;
    
    private Long teacherId;
    private Long courseId;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;
    
    private Long supervisorId;
}
