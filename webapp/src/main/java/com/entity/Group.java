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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public User getMainTeacher() {
		return mainTeacher;
	}

	public void setMainTeacher(User mainTeacher) {
		this.mainTeacher = mainTeacher;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public User getSupervisor() {
		return supervisor;
	}

	public void setSupervisor(User supervisor) {
		this.supervisor = supervisor;
	}

	public String getGroupDetail() {
		return groupDetail;
	}

	public void setGroupDetail(String groupDetail) {
		this.groupDetail = groupDetail;
	}

	public Boolean getFormat() {
		return format;
	}

	public void setFormat(Boolean format) {
		this.format = format;
	}

    // Getters and Setters
    
}
