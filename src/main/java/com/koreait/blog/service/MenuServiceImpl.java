package com.koreait.blog.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.koreait.blog.domain.Menu;
import com.koreait.blog.repository.MenuRepository;

public class MenuServiceImpl implements MenuService {
	
	private MenuRepository repository;
	
	public MenuServiceImpl(SqlSessionTemplate sqlSession) {
		repository = sqlSession.getMapper(MenuRepository.class);
	}

	@Override
	public List<Menu> getMenuList() throws Exception {
		return repository.selectMenuList();
	}

	@Override
	public void insertMenu(Menu menu) throws Exception {
		repository.insertMenu(menu);
	}

	@Override
	public void updateMenu(Menu menu) throws Exception {
		repository.updateMenu(menu);
	}

	@Override
	public void deleteMenu(String code) throws Exception {
		repository.deleteMenu(code);
	}

}
