package com.dto;
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
public class studentRegistrationDto {
	String fullname;
	Integer age;
	String username;
	String password;
	Long id;
}
