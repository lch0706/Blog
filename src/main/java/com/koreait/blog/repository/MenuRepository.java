package com.koreait.blog.repository;

import java.util.List;

import com.koreait.blog.domain.Menu;

public interface MenuRepository {
	
	public List<Menu> selectMenuList() throws Exception;
	public int insertMenu(Menu menu) throws Exception;
	public int updateMenu(Menu menu) throws Exception;
	public int deleteMenu(String code) throws Exception;

}
