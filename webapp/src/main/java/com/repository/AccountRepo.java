package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.dto.LessonDto;
import com.dto.accountDTO;
import com.dto.showMainViewUserDTO;
import com.entity.Account;
import com.entity.User;

@Repository
public interface AccountRepo extends JpaRepository<Account, Long> {

	@Query("SELECT new com.dto.accountDTO(a.id, a.username, a.password) " +
		       "FROM User u JOIN u.account a " +
		       "WHERE u.id = :userid")
		accountDTO findAccountByUserId(@Param("userid") Long userid);


}
