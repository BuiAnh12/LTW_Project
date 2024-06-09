package com.model;

import java.math.BigInteger;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StudentTable {
    private String firstName;
    private Integer id;
    private Integer age;
    private String groupTitle;
    private Integer groupId;
    private String description;
    private String teacherName;
    private Integer teacherId;
    private String courseName;
    private Long courseId;

    @Builder
    public StudentTable(String firstName,Integer id, Integer age, String groupTitle, Integer groupId, String description,
                        String teacherName, Integer teacherId, String courseName, Long courseId) {
        this.firstName = firstName;
        this.id = id;
        this.age = age;
        this.groupTitle = groupTitle;
        this.groupId = groupId;
        this.description = description;
        this.teacherName = teacherName;
        this.teacherId = teacherId;
        this.courseName = courseName;
        this.courseId = courseId;
    }


}
