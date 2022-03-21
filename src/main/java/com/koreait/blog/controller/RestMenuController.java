package com.koreait.blog.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.koreait.blog.domain.Menu;
import com.koreait.blog.service.MenuService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/restMenu")
@AllArgsConstructor
public class RestMenuController {
	
	private MenuService service;
	
	@PostMapping(value = "/getMenuList", produces="application/json; charset=UTF-8")
	public Map<String, Object> getMenuList() throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			result.put("menuList", service.getMenuList());
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
		}
		
		return result;
	}
	
	@PostMapping(value = "/insertMenu", produces="application/json; charset=UTF-8")
	public Map<String, Object> insertMenu(@RequestBody Menu menu) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			service.insertMenu(menu);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	@PostMapping(value = "/updateMenu", produces="application/json; charset=UTF-8")
	public Map<String, Object> updateMenu(Menu menu) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			service.updateMenu(menu);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}
	
	@PostMapping(value = "/deleteMenu", produces="application/json; charset=UTF-8")
	public Map<String, Object> deleteMenu(@RequestParam("code") String code) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			service.deleteMenu(code);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
		}
		
		return result;
	}

}
