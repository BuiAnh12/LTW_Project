package com.entity;
import javax.persistence.*;
import java.util.Date;

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
    
    @Column(name = "group_detail")
    private String groupDetail;
    
    private Boolean format;

    // Getters and Setters
}
