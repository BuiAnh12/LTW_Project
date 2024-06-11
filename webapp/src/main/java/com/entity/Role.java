package com.entity;

	import java.util.List;

import javax.persistence.*;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "role")
public class Role {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @ManyToMany(mappedBy = "roles")
    private List<Account> accounts ;
    
    @Override
    public String toString() {
        return "Role(" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ')';
    }
}
