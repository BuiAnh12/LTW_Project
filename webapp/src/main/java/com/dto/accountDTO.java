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
public class accountDTO {
	
	private Long accountId;
	
    private String accountUsername;
    
    private String accountPassword;

}
