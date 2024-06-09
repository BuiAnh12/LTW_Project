package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.Account;
@Repository
public interface AccountRepository extends JpaRepository<Account, Long>{
	Account findOneByUserNameAndStatus(String username, int status);
}