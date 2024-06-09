package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dto.showMainViewUserDTO;
import com.entity.User;

@Repository
public interface UserRepo extends JpaRepository<User,Long> {
    @Query("SELECT new com.dto.showMainViewUserDTO( u.id,u.name, u.email,u.phone, a.username,u.role) " +
            "FROM User u JOIN u.account a")
     List<showMainViewUserDTO> findUserAccountDetails();
}
