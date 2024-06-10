package com.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.dto.studentRegistrationDto;
import com.entity.Registration;
@Repository
public interface RegistrationRepository extends JpaRepository<Registration, Integer>{
    Long countByGroupId(Integer groupId);

    @Query("SELECT new com.dto.studentRegistrationDto(r.student.id, CONCAT(s.firstname, ' ', s.middlename, ' ', s.lastname), s.age, s.login, s.password) " +
    	       "FROM Registration r JOIN r.student s WHERE r.group.id = :groupId AND s.id = r.student.id")
    	List<studentRegistrationDto> findAllByGroupId(@Param("groupId") Integer groupId);
	@Modifying
    @Transactional
    @Query(value = "INSERT INTO registration (group_id, student_id) VALUES (:groupId, :studentId)", nativeQuery = true)
    void addStudentInGroup(@Param("groupId") Long groupId, @Param("studentId") Long studentId);
}

