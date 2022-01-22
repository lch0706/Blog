package com.koreait.blog.repository;

import java.util.List;

import com.koreait.blog.domain.Board;
import com.koreait.blog.util.Search;

public interface BoardRepository {

	public List<Board> selectBoardList(Search search) throws Exception;
	public int selectBoardListCnt(Search search) throws Exception;
	public Board selectBoardBybno(Long bno) throws Exception;
	public int insertBoard(Board board) throws Exception;
	public int updateBoard(Board board) throws Exception;
	public int deleteBoard(Long bno) throws Exception;
	public int updateViewCnt(Long bno) throws Exception;
}