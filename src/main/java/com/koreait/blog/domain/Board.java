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
public class Board {
	
	private Long bno;
	private String cateCd;
	private String title;
	private String name;
	private String content;
	private String tag;
	private Long viewCnt;
	private String regDate;

}


