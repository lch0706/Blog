package com.koreait.blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.blog.domain.User;
import com.koreait.blog.service.UserService;
import com.koreait.blog.util.Search;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("user")
@AllArgsConstructor
public class UserController {
	
	private UserService service;
	
	@GetMapping(value = "/getUserList")
	public String getUserList(Model model
							 , @RequestParam(required = false, defaultValue = "1") int page
							 , @RequestParam(required = false, defaultValue = "1") int range
							 , @RequestParam(required = false, defaultValue = "uno") String searchType
							 , @RequestParam(required = false) String query
							 , @ModelAttribute("search") Search search
							 ) throws Exception {
		// 검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setQuery(query);
		
		// 전체 유저 개수
		int listCnt = service.getUserListCnt(search);
		
		search.pageInfo(page, range, listCnt);
		
		// 페이징
		model.addAttribute("pageUtils", search);
		
		model.addAttribute("query", query);
		model.addAttribute("searchType", searchType);
		// 게시글 출력
		model.addAttribute("userList", service.getUserList(search));
		
		return "user/userList";
	}
	
	@PostMapping(value = "/insertUser")
	public String insertUser(@ModelAttribute("user") User user, RedirectAttributes rttr) throws Exception {
		
		System.out.println("user : " + user.toString());
		service.insertUser(user);
		
		return "redirect:/user/getUserList";
	}
	
	@PostMapping(value = "/loginUser")
	public String loginUser(@ModelAttribute("user") User user, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		System.out.println("user : " + user.toString());
		service.loginUser(user, session);
		
		return "redirect:/";
		
	}
	
	@GetMapping(value = "/logoutUser")
	public String logoutUser(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	


}
