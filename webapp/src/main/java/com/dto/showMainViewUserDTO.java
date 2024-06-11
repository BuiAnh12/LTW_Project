package com.dto;

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
public class showMainViewUserDTO {
		@NotNull(message = "error_entity_03")
		private Long userId;
		
		private String userEmail;
		
		private String userName;

		private Integer userPhone;

		private String accountUserName;
		
		private String userRoleName;
		
		private Boolean userStatus;

}
