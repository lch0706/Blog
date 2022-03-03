package com.koreait.blog.repository;

import java.util.List;

import com.koreait.blog.domain.User;

public interface UserRepository {
	
	public List<User> selectUserList() throws Exception;
	
	public User selectUserinfo(String uno) throws Exception;
	
	public int insertUser(User user) throws Exception;
	
	public int updatetUser(User user) throws Exception;
	
	public int deleteUser(String uno) throws Exception;
	
	
	

}
