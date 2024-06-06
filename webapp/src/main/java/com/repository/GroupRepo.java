package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.entity.Group;

@Repository
public interface  GroupRepo extends JpaRepository<Group, Integer> {

}
