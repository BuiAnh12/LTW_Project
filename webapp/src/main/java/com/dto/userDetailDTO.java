package com.dto;

import java.security.KeyStore.PrivateKeyEntry;

import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class userDetailDTO {
	
	@NotNull(message = "error_entity_03")
	private String userName;
	
	private Long userId;
	
	private String userEmail;
	
	private String userPhone;
	private Long userRole;

	private accountDTO accountDto;

	
}
