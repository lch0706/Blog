package com.koreait.blog.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		
		service.insertUser(user);
		
		return "redirect:/user/getUserList";
	}
	
	@PostMapping(value = "/loginUser")
	public String loginUser(@ModelAttribute("user") User user, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		service.loginUser(user, session);
		
		return "redirect:/board/getBoardList";
		
	}
	
	@GetMapping(value = "/logoutUser")
	public void logoutUser(HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그아웃 성공')");
			out.println("location.href='/blog/board/getBoardList'");
			out.println("</script>");
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
