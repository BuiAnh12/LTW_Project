package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.entity.User;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {
    @Query("SELECT u FROM User u WHERE u.account.id = :accountId")
    User findOneByUserAccountId(@Param("accountId") Long accountId);
    
    @Query("SELECT DISTINCT u FROM User u JOIN u.account a JOIN a.roles r WHERE r.code = 'TEACHER'")
    List<User> findAllTeacher();
    
    @Query("SELECT DISTINCT u FROM User u INNER JOIN u.account a INNER JOIN a.roles r WHERE r.code = 'ADMIN'")
    List<User> findAllSupervisor();
    
    @Query("SELECT u from User u WHERE u.id = ?1")
	User findById(Long teacherId);
}

