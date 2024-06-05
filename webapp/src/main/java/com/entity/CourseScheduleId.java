package com.entity;

import java.io.Serializable;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CourseScheduleId implements Serializable {
    private int group;
    private int lesson;
}
