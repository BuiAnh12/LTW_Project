package com.entity;

import javax.persistence.*;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    private Integer phone;

    private String email;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    private Integer officeId;

    @ManyToOne
    @JoinColumn(name = "account_id")
    private Account account;
}
