package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.constant.SystemConstant;
import com.dto.MyUser;
import com.entity.Account;
import com.entity.Role;
import com.entity.User;
import com.repository.AccountRepository;
import com.repository.UserRepo;

@Service
public class customUserDetailsService implements UserDetailsService{
	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private UserRepo userRepo;
	

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountRepository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);
		if(account == null) {
			throw new UsernameNotFoundException("User not found");
		}
		User user = userRepo.findOneByUserAccountId(account.getId());
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (Role role : account.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		
		MyUser myUser = new MyUser(account.getUserName(), account.getPassword(), true, true, true, true, authorities);
		myUser.setFullName(user.getName());;
		return myUser;
	}

}
