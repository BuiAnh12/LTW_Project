package com.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.entity.Account;
@Repository
public interface AccountRepository extends JpaRepository<Account, Long>{
	Account findOneByUserNameAndStatus(String username, int status);
	
	@Transactional
    @Modifying
    @Query(value = "INSERT INTO account_role (account_id, role_id) VALUES (:accountId, :roleId)", nativeQuery = true)
    void addAccountRole(@Param("accountId") Long accountId, @Param("roleId") Long roleId);
	
	@Modifying
    @Transactional
    @Query(value = "UPDATE account_role SET role_id = :roleId WHERE account_id = :accountId", nativeQuery = true)
    void updateUserRoleByAccountId(@Param("accountId") Long accountId,@Param("roleId")Long roleId);
	
	
}
