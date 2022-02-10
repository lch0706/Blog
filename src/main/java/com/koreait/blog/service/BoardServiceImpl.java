package com.koreait.blog.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.koreait.blog.domain.Board;
import com.koreait.blog.domain.Reply;
import com.koreait.blog.repository.BoardRepository;
import com.koreait.blog.util.Search;

public class BoardServiceImpl implements BoardService {
	
	private BoardRepository repository;
	
	public BoardServiceImpl(SqlSessionTemplate sqlSession) {
		repository = sqlSession.getMapper(BoardRepository.class);
	}
	
	// 게시글 목록
	@Override
	public List<Board> getBoardList(Search search) throws Exception {
		return repository.selectBoardList(search);
	}
	
	// 총 게시글 개수 확인
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return repository.selectBoardListCnt(search);
	}
	
	// 게시글 등록
	@Override
	public void insertBoard(Board board, HttpServletResponse response) throws Exception {
		int result = repository.insertBoard(board);
		message(result, response, "게시글이 등록되었습니다.", "등록 실패", "/blog/board/getBoardList");
	}
	
	// 게시글 상세조회 + 조회수 + 조회수 중복방지
	@Transactional
	@Override
	public Board getBoardDetail(Long bno, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(bno.toString());
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("viewCnt")) {
					oldCookie = cookie;
				}
			}
		}
		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + bno.toString() + "]")) {
				repository.updateViewCnt(bno);
				oldCookie.setValue(oldCookie.getValue() + "_[" + bno + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(60 * 60 * 24);
				response.addCookie(oldCookie);
			}
		} else {
			repository.updateViewCnt(bno);
			Cookie newCookie = new Cookie("viewCnt", "[" + bno + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(60 * 60 * 24);
			response.addCookie(newCookie);
		}
		return repository.selectBoardBybno(bno);
	}
	
	// 게시글 수정
	@Override
	public void updateBoard(Board board, HttpServletResponse response) throws Exception {
		int result = repository.updateBoard(board);
		message(result, response, "게시글이 수정되었습니다.", "수정 실패", "/blog/board/getBoardList");
	}
	
	// 게시글 삭제
	@Override
	public void deleteBoard(Long bno, HttpServletResponse response) throws Exception {
		int result = repository.deleteBoard(bno);
		message(result, response, "게시글이 삭제되었습니다.", "삭제 실패", "/blog/board/getBoardList");
	}
	
	@Override
	public List<Reply> getReplyList(Long bno) throws Exception {
		return repository.selectReplyList(bno);
	}
	
	@Override
	public int insertReply(Reply reply) throws Exception {
		return repository.insertReply(reply);
	}
	
	@Override
	public int updateReply(Reply reply) throws Exception {
		return repository.updateReply(reply);
	}
	
	@Override
	public int deleteReply(Long rno) throws Exception {
		return repository.deleteReply(rno);
	}

}
