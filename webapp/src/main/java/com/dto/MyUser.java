package com.dto;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.entity.Role;

import lombok.*;
@Getter
@Setter

public class MyUser extends User{
	public MyUser(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}
	private String fullName;
	private Long userId;
	private List<Role> preveledge;
}
