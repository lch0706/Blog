package com.koreait.blog.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.koreait.blog.domain.User;
import com.koreait.blog.repository.UserRepository;

public class UserServiceImpl implements UserService {
	
	private UserRepository repository;
	
	public UserServiceImpl(SqlSessionTemplate sqlSession) {
		repository = sqlSession.getMapper(UserRepository.class);
	}

	@Override
	public List<User> getUserList() throws Exception {
		return repository.selectUserList();
	}

	@Override
	public User getUserInfo(String uno) throws Exception {
		return repository.selectUserinfo(uno);
	}

	@Override
	public void insertUser(User user) throws Exception {
		repository.insertUser(user);
	}

	@Override
	public void updateUser(User user) throws Exception {
		repository.updatetUser(user);

	}

	@Override
	public void deleteUser(String uno) throws Exception {
		repository.deleteUser(uno);
	}

}
