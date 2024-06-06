package com.entity;

import javax.persistence.*;

@Entity
public class Registration {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "group_id")
    private Group group;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;

    private Boolean status;

    // Getters and Setters
}

