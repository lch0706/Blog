package com.koreait.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.blog.domain.User;
@Controller
@RequestMapping("login")
public class LoginController {
	
	@GetMapping(value = "/loginForm")
	public String loginForm(Model model) throws Exception {
		model.addAttribute("user", new User());
		return "login/login";
	}
	
	@GetMapping(value = "/signupForm" )
	public String signupForm(Model model) throws Exception {
		model.addAttribute("user", new User());
		return "login/signupForm";
	}

}
