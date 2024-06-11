package com.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DashboardModel {
    private long onlineStudent;
    private long offlineStudent;
    
    private long onlineGroup;
    private long offlineGroup;
    
    private long activeCourse;
    
    private long userNumber;
    private long teacherNumber;
    
    private float studentPerGroup;
    private float studentPerOnl;
    private float studentPerOff;
    
    @Builder
    public DashboardModel(long onlineStudent, long offlineStudent, long onlineGroup, long offlineGroup, long activeCourse,
                          long userNumber, long teacherNumber) {
        this.onlineStudent = onlineStudent;
        this.offlineStudent = offlineStudent;
        this.onlineGroup = onlineGroup;
        this.offlineGroup = offlineGroup;
        this.activeCourse = activeCourse;
        this.userNumber = userNumber;
        this.teacherNumber = teacherNumber;
        if (onlineGroup + offlineGroup != 0) {
            this.studentPerGroup = (onlineStudent + offlineStudent) / (onlineGroup + offlineGroup);
		}
        if (offlineGroup != 0) {
        	this.studentPerOff = offlineStudent / offlineGroup;
        }
        else {
        	this.studentPerOff = 0;
		}
        if (onlineGroup != 0) {
        	this.studentPerOnl = onlineStudent / onlineGroup;
        }
        else {
        	this.studentPerOnl = 0;
		}
    }
}
