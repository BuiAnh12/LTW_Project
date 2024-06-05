package com.entity;

import java.time.LocalDate;
import javax.persistence.*;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "course_schedule")
@IdClass(CourseScheduleId.class)
public class CourseSchedule {
    @Id
    @ManyToOne
    @JoinColumn(name = "group_id")
    private Group group;

    @Id
    @ManyToOne
    @JoinColumn(name = "lesson_id")
    private Lesson lesson;

    @Column(name = "occur_date")
    private LocalDate occurDate;

    private boolean status;

    @ManyToOne
    @JoinColumn(name = "teacher_id")
    private User teacher;
}
