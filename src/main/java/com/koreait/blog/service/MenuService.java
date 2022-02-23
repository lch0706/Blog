package com.koreait.blog.service;

import java.util.List;

import com.koreait.blog.domain.Menu;

public interface MenuService {
	
	public List<Menu> getMenuList() throws Exception;
	public void insertMenu(Menu menu) throws Exception;
	public void updateMenu(Menu menu) throws Exception;
	public void deleteMenu(String code) throws Exception;

 
}
