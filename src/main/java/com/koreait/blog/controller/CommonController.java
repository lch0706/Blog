package com.koreait.blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.blog.domain.Board;
import com.koreait.blog.domain.Menu;
import com.koreait.blog.domain.User;
import com.koreait.blog.service.BoardService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CommonController {
	
	private BoardService service;

	// 메인화면 이동
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	// 목록화면 이동
	@GetMapping("board/boardForm")
	public String boardForm(@ModelAttribute("board") Board board, Model model) {
		return "board/insert";
	}
	
	// 수정화면 이동
	@GetMapping("board/updateForm")
	public String modifyForm(@RequestParam("bno") Long bno
			       			, @RequestParam("mode") String mode
			       			, HttpServletRequest request
			       			, HttpServletResponse response
			       			, Model model) throws Exception {
		model.addAttribute("boardDetail", service.getBoardDetail(bno, request, response));
		model.addAttribute("mode", mode);
		model.addAttribute("board", new Board());
		return "board/insert";
	}
	
	// 메뉴리스트 화면 이동
	@GetMapping(value = "menu/getMenuList")
	public String getMenuList(Model model) throws Exception {
		model.addAttribute("menu", new Menu());
		
		return "menu/menu";
	}
	
	// 로그인 화면 이동
	@GetMapping(value = "login/loginForm")
	public String loginForm(Model model) throws Exception {
		model.addAttribute("user", new User());
		return "login/login";
	}
	// 회원가입 화면 이동
	@GetMapping(value = "login/signupForm" )
	public String signupForm(Model model) throws Exception {
		model.addAttribute("user", new User());
		return "login/signupForm";
	}
	
}
	
