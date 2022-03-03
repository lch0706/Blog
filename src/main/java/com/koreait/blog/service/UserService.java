package com.koreait.blog.service;

import java.util.List;

import com.koreait.blog.domain.User;

public interface UserService {
	
	public List<User> getUserList() throws Exception;
	
	public User getUserInfo(String uno) throws Exception;
	
	public void insertUser(User user) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void deleteUser(String uno) throws Exception;

}
