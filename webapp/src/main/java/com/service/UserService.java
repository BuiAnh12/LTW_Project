package com.service;

import java.util.NoSuchElementException;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.accountDTO;
import com.dto.userDetailDTO;
import com.entity.Account;
import com.entity.Course;
import com.entity.Lesson;
import com.entity.Role;
import com.entity.User;
import com.repository.AccountRepository;
import com.repository.RoleRepository;
import com.repository.UserRepo;

import lombok.RequiredArgsConstructor;
import javax.persistence.EntityManager;

@Service
@RequiredArgsConstructor
public class UserService {
	@Autowired
	private final UserRepo userRepo;
	@Autowired
	private final AccountRepository accountRepo;
	@Autowired
	private final EntityManager entityManager;
	@Autowired
	private final RoleRepository roleRepository;

	@Transactional(rollbackOn = { Exception.class })
	public void addUser(userDetailDTO userObject) {
		System.out.println("Đã chạy đến userService");
		try {		
		    Account account = Account.builder()
		            .password(userObject.getAccountDto().getAccountPassword())
		            .userName(userObject.getAccountDto().getAccountUsername())
		            .status(1)
		            .build();	    
		    accountRepo.save(account);
		    accountRepo.addAccountRole(account.getId(), userObject.getUserRoleId());

		    User newUser = User.builder()
		            .email(userObject.getUserEmail())
		            .name(userObject.getUserName())
		            .phone(userObject.getUserPhone())
		            .account(account)
		            .status(true)
		            .build();

		    userRepo.save(newUser);
		    System.out.println("Save data successfull");
		} catch (Exception e) {
		    System.out.println("Failed save data: " + e.getMessage());
		    e.printStackTrace(); 
		}
	}

	@Transactional(rollbackOn = { Exception.class })
	public void updateUser(userDetailDTO userDTO, HttpServletRequest request) {
		final String userId = request.getParameter("userId");
		if (userId == null || userId.isEmpty()) {
			throw new IllegalArgumentException("User ID is required for update");
		}
		try {
			// Find the user by ID
			User user = userRepo.findOne(Long.parseLong(userId));
			if (user == null) {
				throw new IllegalArgumentException("User not found with ID: " + userDTO.getUserId());
			}

			// Update user details
			user.setName(userDTO.getUserName());
			user.setPhone(userDTO.getUserPhone());
			user.setEmail(userDTO.getUserEmail());
			user.setStatus(userDTO.getUserStatus());
			userRepo.save(user);

			// Update user role
			Long userRoleId = userDTO.getUserRoleId();
			System.out.println("userroleId trong udpate userserviece: "+userRoleId);
			Long userAccountID=userRepo.findAccountIdByUserId(Long.parseLong(userId));
			accountRepo.updateUserRoleByAccountId(userAccountID, userRoleId);

		} catch (IllegalArgumentException e) {
			// Handle user not found case
			System.err.println(e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			// Handle other exceptions
			System.err.println("An error occurred while updating the user: " + e.getMessage());
			e.printStackTrace();
		}
	}

	@Transactional(rollbackOn = { Exception.class })
	public void deleteUser(HttpServletRequest request) {
		Long userid = Long.parseLong(request.getParameter("userId"));
		System.out.println("da vao dc delete ");
		if (!userRepo.exists(userid))
			throw new NoSuchElementException("User Id not found!");
		;
		
		try {
		    User tmp = userRepo.findOne(userid);
		    if (tmp != null) {
		        Account account = accountRepo.findOne(tmp.getAccount().getId());
		        if (account != null) {
		            account.setStatus(0); // Set account status to 0
		            tmp.setStatus(false); // Set user status to false
		            userRepo.save(tmp); // Save user
		            accountRepo.save(account); // Save account
		        } else {
		            System.out.println("Account not found for user: " + userid);
		        }
		    } else {
		        System.out.println("User not found: " + userid);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		    // Handle exception (e.g., logging, custom error handling)
		}
		
	}
}
