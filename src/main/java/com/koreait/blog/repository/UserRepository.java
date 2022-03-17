package com.koreait.blog.repository;

import java.util.List;

import com.koreait.blog.domain.User;
import com.koreait.blog.util.Search;

public interface UserRepository {
	
	public List<User> selectUserList(Search search) throws Exception;
	
	public int selectUserListCnt(Search search) throws Exception;
	
	public int insertUser(User user) throws Exception;
	
	public User loginUser(User user) throws Exception;
	
	public int updatetUser(User user) throws Exception;
	
	public int deleteUser(String uno) throws Exception;
	
	
	

}
