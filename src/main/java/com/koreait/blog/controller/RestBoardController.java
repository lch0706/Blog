package com.koreait.blog.controller;

import java.util.List;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.koreait.blog.domain.Reply;
import com.koreait.blog.service.BoardService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping(value = "/restBoard")
@AllArgsConstructor
public class RestBoardController {
	
	private BoardService service;
	
	@PostMapping(value = "/getReplyList", produces="application/json; charset=UTF-8")
	public List<Reply> getReplyList(@RequestParam("bno") Long bno) throws Exception {
		return service.getReplyList(bno);
	}

}
