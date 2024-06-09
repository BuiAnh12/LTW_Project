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
import com.entity.User;
import com.repository.AccountRepo;
import com.repository.UserRepo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	@Autowired
	private final UserRepo userRepo;
	@Autowired
	private final AccountRepo accountRepo;

	@Transactional(rollbackOn = { Exception.class })
	public void addUser(userDetailDTO userObject) {
		System.out.println("Da chay vao service UserService");
		
		Account account = Account.builder()
				.username(userObject.getAccountDto().getAccountUsername())
				.password(userObject.getAccountDto().getAccountPassword())
				.build();
		accountRepo.save(account);
		System.out.println("AccountUsername"+userObject.getAccountDto().getAccountUsername());
		
		User user =User.builder()
				.name(userObject.getUserName())
				.email(userObject.getUserEmail())
				.phone(userObject.getUserPhone())
				.role(userObject.getUserRole())
				.account(account)
				.build();
		userRepo.save(user);
		System.out.println("Username: "+userObject.getUserName());
		

	}

	@Transactional(rollbackOn = { Exception.class })
	public void updateUser(userDetailDTO userDTO, HttpServletRequest request) {
		final String userId = request.getParameter("userId");
		if (userId == null || userId.isEmpty()) {
			throw new IllegalArgumentException("User ID is required for update");
		}
		System.out.println("vo duoc service update user");
		System.out.println(userDTO.getUserName() + "hehe");
		User user = userRepo.findOne(Long.parseLong(userId));
		user.setName(userDTO.getUserName());
		user.setPhone(userDTO.getUserPhone());
		user.setEmail(userDTO.getUserEmail());
		user.setRole(userDTO.getUserRole());
		userRepo.save(user);
	}

	@Transactional(rollbackOn = { Exception.class })
	public void deleteUser(HttpServletRequest request) {
		Long userid = Long.parseLong(request.getParameter("userId"));
		if (!userRepo.exists(userid))
			throw new NoSuchElementException("User Id not found!");
		;
		userRepo.delete(userid);
	}
}
