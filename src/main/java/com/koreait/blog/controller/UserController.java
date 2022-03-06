package com.koreait.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.blog.domain.User;
import com.koreait.blog.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	private UserService service;
	
	@GetMapping(value = "/getUserList")
	public String getUserList(Model model) throws Exception {
		model.addAttribute("userList", service.getUserList());
		
		return "user/userList";
	}
	
	@PostMapping(value = "/insertUser")
	public String insertUser(@ModelAttribute("User") User user, RedirectAttributes rttr) throws Exception {
		service.insertUser(user);
		
		return "redirect:/user/getUserList";
	}
	


}
