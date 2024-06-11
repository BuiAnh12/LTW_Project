package com.entity;

import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "registration")
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

