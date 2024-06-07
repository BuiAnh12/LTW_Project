package com.model;


public class SearchForm {
    private String startDate;
    private String endDate;
    private String nextLesson;
    private String courseName;
    private String groupTitle;
    private String teacherName;
    private String format;

    // Getters and setters for all fields
    
    

    public String getStartDate() {
        return startDate;
    }

    public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getNextLesson() {
        return nextLesson;
    }

    public void setNextLesson(String nextLesson) {
        this.nextLesson = nextLesson;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getGroupTitle() {
        return groupTitle;
    }

    public void setGroupTitle(String groupTitle) {
        this.groupTitle = groupTitle;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
}
