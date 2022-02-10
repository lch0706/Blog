package com.koreait.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@PostMapping(value = "/saveReply", produces="application/json; charset=UTF-8")
	public Map<String, Object> saveReply(@RequestBody Reply reply) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		try {
			service.insertReply(reply);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}
	
	@PostMapping(value = "/updateReply", produces="application/json; charset=UTF-8")
	public Map<String, Object> updateReply(@RequestBody Reply reply) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		try {
			service.updateReply(reply);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}
	
	@PostMapping(value = "/deleteReply", produces="application/json; charset=UTF-8")
	public Map<String, Object> deleteReply(@RequestParam("rno") Long rno) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		try {
			service.deleteReply(rno);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}

}
