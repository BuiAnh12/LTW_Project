package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.entity.CourseSchedule;
import com.entity.Role;

@Repository
	public interface RoleRepository extends JpaRepository<Role, Long> {
	
	@Query(value = "SELECT role_id FROM account_role WHERE account_id = :accountId", nativeQuery = true)
    Long findRoleIdByAccountId(@Param("accountId") Long accountId);
}
