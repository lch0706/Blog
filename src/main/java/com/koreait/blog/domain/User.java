package com.koreait.blog.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class User {
	
	private String uno;
	private String name;
	private String password;
	private String repassword;
	private String email;
	private String grade;
	private String regdate;

}
