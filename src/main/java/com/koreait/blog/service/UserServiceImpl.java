package com.koreait.blog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import com.koreait.blog.domain.User;
import com.koreait.blog.repository.UserRepository;
import com.koreait.blog.util.Search;

public class UserServiceImpl implements UserService {
	
	private UserRepository repository;
	
	public UserServiceImpl(SqlSessionTemplate sqlSession) {
		repository = sqlSession.getMapper(UserRepository.class);
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		return repository.selectUserList(search);
	}

	@Override
	public int getUserListCnt(Search search) throws Exception {
		return repository.selectUserListCnt(search);
	}

	@Override
	public int insertUser(User user) throws Exception {
		return repository.insertUser(user);
	}
	
	@Override
	public User loginUser(User user, HttpSession session) throws Exception {
		User loginUser = repository.loginUser(user);
		if (loginUser != null) {
			session.setAttribute("loginUser", loginUser);
		}
		return loginUser;
	}

	@Override
	public int updateUser(User user) throws Exception {
		return repository.updatetUser(user);

	}

	@Override
	public int deleteUser(String uno) throws Exception {
		return repository.deleteUser(uno);
	}

}
