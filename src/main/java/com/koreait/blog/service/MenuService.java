package com.koreait.blog.service;

import java.util.List;

import com.koreait.blog.domain.Menu;

public interface MenuService {
	
	public List<Menu> getMenuList() throws Exception;
	public int insertMenu(Menu menu) throws Exception;
	public int updateMenu(Menu menu) throws Exception;
	public int deleteMenu(String code) throws Exception;

 
}
