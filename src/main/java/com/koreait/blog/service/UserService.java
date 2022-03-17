package com.koreait.blog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.koreait.blog.domain.User;
import com.koreait.blog.util.Search;

public interface UserService {
	
	public List<User> getUserList(Search search) throws Exception;
	
	public int getUserListCnt(Search search) throws Exception;
	
	public int insertUser(User user) throws Exception;
	
	public User loginUser(User user, HttpSession session) throws Exception;
		
	public int updateUser(User user) throws Exception;
	
	public int deleteUser(String uno) throws Exception;

}
