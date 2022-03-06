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
public class Menu {
	
	private int mno;
	private String code;
	private String codename;
	private int sort_num;
	private String comment;
	private String regdate;
	

}
