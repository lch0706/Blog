package com.koreait.blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.blog.domain.Board;
import com.koreait.blog.domain.Reply;
import com.koreait.blog.service.BoardService;
import com.koreait.blog.util.Search;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping ("board")
@AllArgsConstructor
public class BoardController {
	
	// private static final Logger logger = LoggerFactory.getLogger(Board.class);
	
	private BoardService service;
	
	// 게시글 목록 불러오기
	@RequestMapping(value= "/getBoardList", method = {RequestMethod.GET, RequestMethod.POST})
	public String getBoardList(Model model
			                   , @RequestParam(required = false, defaultValue = "1") int page
			                   , @RequestParam(required = false, defaultValue = "1") int range
			                   , @RequestParam(required = false, defaultValue = "title") String searchType
			                   , @RequestParam(required = false) String query
			                   , @ModelAttribute("search") Search search
			                   ) throws Exception {
		// 검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setQuery(query);
		
		// 전체 게시글 개수
		int listCnt = service.getBoardListCnt(search);
		
		search.pageInfo(page, range, listCnt);
		
		// 페어징
		model.addAttribute("pageUtils", search);
		
		model.addAttribute("query", query);
		model.addAttribute("searchType", searchType);
		
		// 게시글 출력
		model.addAttribute("boardList", service.getBoardList(search));
		return "board/list";
	}
	
	// 게시글 등록 + 수정
	@PostMapping(value = "/saveBoard")
	public void saveBoard(@ModelAttribute("board") Board board
			                , @RequestParam("mode") String mode
			                , RedirectAttributes rttr
			                , HttpServletResponse response) throws Exception {
		if (mode.equals("update")) {
			service.updateBoard(board, response);
		} else {
			service.insertBoard(board, response);
		}
	}
	
	// 게시글 상세보기
	@GetMapping(value = "/getBoardDetail")
	public String getBoardDetail( HttpServletRequest request
								, HttpServletResponse response 
								, Model model
								, @RequestParam("bno") Long bno) throws Exception {
		model.addAttribute("boardDetail", service.getBoardDetail(bno, request, response));
		model.addAttribute("Reply", new Reply());
		return "board/detail";
	}
	
	// 게시글 삭제
	@GetMapping(value ="/deleteBoard")
	public void deleteBoard(RedirectAttributes rttr, @RequestParam("bno") Long bno, HttpServletResponse response) throws Exception {
		service.deleteBoard(bno, response);
	}
	
	/* @ExceptionHandler를 사용한 예외처리 방식
	@ExceptionHandler(RuntimeException.class)
	public String exceptionHandler(Model model, Exception e) {
		logger.info("exception : " + e.getMessage());
		model.addAttribute("exception", e);
		return "error/exception";
	}
	*/
}
