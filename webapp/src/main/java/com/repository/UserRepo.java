package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.dto.accountRoleDTO;
import com.dto.showMainViewUserDTO;
import com.entity.User;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {

	@Query("SELECT u FROM User u WHERE u.account.id = :accountId")
	User findOneByUserAccountId(@Param("accountId") Long accountId);

	@Query("SELECT new com.dto.showMainViewUserDTO(u.id, u.email, u.name,u.phone,a.userName,r.name,u.status) "
			+ "FROM User u JOIN u.account a JOIN a.roles r")
	List<showMainViewUserDTO> findAllUserAccountDetails();
	
	@Query("SELECT DISTINCT u FROM User u JOIN u.account a JOIN a.roles r WHERE r.code = 'TEACHER'")
    List<User> findAllTeacher();
	
	@Query(value = "SELECT account_id FROM user WHERE id = :userId", nativeQuery = true)
    Long findAccountIdByUserId(@Param("userId") Long userId);
}

