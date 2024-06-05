package com.entity;

import java.io.Serializable;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegistrationId implements Serializable {
    private int group;
    private int student;
}
