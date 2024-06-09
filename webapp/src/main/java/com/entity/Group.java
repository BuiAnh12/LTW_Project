package com.entity;
import javax.persistence.*;

import com.dto.LessonDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "`Group`")
public class Group {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @ManyToOne
    @JoinColumn(name = "main_teacher_id")
    private User mainTeacher;
    
    @Column(name = "start_date")
    @Temporal(TemporalType.DATE)
    private Date startDate;
    
    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)
    private Date endDate;

    @ManyToOne
    @JoinColumn(name = "supervisor_id")
    private User supervisor;
   
    private Boolean format;
    
    @Column(name = "status", nullable = false, columnDefinition = "BIT DEFAULT 1")
    private boolean status;
    
    @Column(name = "title")
    private String title; 
}
