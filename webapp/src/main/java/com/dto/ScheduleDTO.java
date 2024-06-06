package com.dto;


public class ScheduleDTO {
    private String occurDate;
    private int lessonId;
    private String nextLesson;
    private int courseId;
    private String courseName;
    private int groupId;
    private String groupTitle;
    private int teacherId;
    private String teacherName;
    private String format;
    
    
    
	public ScheduleDTO() {
		super();
	}
	
	public ScheduleDTO(String occurDate, int lessonId, String nextLesson, int courseId, String courseName,
			int groupId, String groupTitle, int teacherId, String teacherName, String format) {
		super();
		this.occurDate = occurDate;
		this.lessonId = lessonId;
		this.nextLesson = nextLesson;
		this.courseId = courseId;
		this.courseName = courseName;
		this.groupId = groupId;
		this.groupTitle = groupTitle;
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		this.format = format;
	}
	public String getOccurDate() {
		return occurDate;
	}
	public void setOccurDate(String occurDate) {
		this.occurDate = occurDate;
	}
	public int getLessonId() {
		return lessonId;
	}
	public void setLessonId(int lessonId) {
		this.lessonId = lessonId;
	}
	public String getNextLesson() {
		return nextLesson;
	}
	public void setNextLesson(String nextLesson) {
		this.nextLesson = nextLesson;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getGroupTitle() {
		return groupTitle;
	}
	public void setGroupTitle(String groupTitle) {
		this.groupTitle = groupTitle;
	}
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String isFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}

    
}
