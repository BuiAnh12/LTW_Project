package com.entity;

import javax.persistence.*;
import lombok.*;
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "lesson")
public class Lesson {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lesson_id")
    private Long lessonId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id", referencedColumnName = "course_id", nullable = false)
    private Course course;

    @Column(name = "detail", nullable = true, columnDefinition = "TEXT")
    private String detail;
    
    @Column(name = "status", nullable = false, columnDefinition = "BIT DEFAULT 1")
    private boolean status;
}
