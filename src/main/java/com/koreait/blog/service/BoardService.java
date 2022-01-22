package com.koreait.blog.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.blog.domain.Board;
import com.koreait.blog.util.PageUtils;
import com.koreait.blog.util.Search;

public interface BoardService {
	
	public List<Board> getBoardList(Search search) throws Exception;
	public int getBoardListCnt(Search search) throws Exception;
	public void insertBoard(Board board, HttpServletResponse response) throws Exception;
	public Board getBoardDetail(Long bno, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void updateBoard(Board board, HttpServletResponse response) throws Exception;
	public void deleteBoard(Long bno, HttpServletResponse response) throws Exception;
	
	// default method
	public default void message(int result, HttpServletResponse response,
								String success, String fail, String path) {
		try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				if (result > 0) {
					out.println("<script>");
					out.println("alert('" + success + "')");
					out.println("location.href='" + path + "'");
					out.println("</script>");
					out.close();
				} else {
					out.println("<script>");
					out.println("alert('" + fail + "')");
					out.println("histroy.back()");
					out.println("</script>");
					out.close();
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
