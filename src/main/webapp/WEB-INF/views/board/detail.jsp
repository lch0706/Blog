<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>board</title>
<script>

	$(document).ready(function(){
		fnBoardList();
		fnBoardUpdate();
		fnBoardDelete();
	});
	
	// 목록으로 이동
	function fnBoardList(){
		$('#list_btn').on('click', function(){
			location.href = "${pageContext.request.contextPath}/board/getBoardList";
		});
	} // end fnBoardList
	
	// 게시글 수정
	function fnBoardUpdate(){
		$('#update_btn').click(function(){
			let url = "${pageContext.request.contextPath}/board/updateForm";
			url = url + "?bno=" + ${boardDetail.bno};
			url = url + "&mode=update";
			location.href = url;
		});
	} // end fnBoardUpdate
	
	// 게시글 삭제
	function fnBoardDelete() {
		$('#delete_btn').click(function(){
			if (confirm('게시글을 삭제하시겠습니까?')) {
				let url = "${pageContext.request.contextPath}/board/deleteBoard";
				url = url + "?bno=" + ${boardDetail.bno};
				location.href = url;
			};
		});
	}
	
</script>
<style>
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>board Detail</h2>
			<div class="bg-white rounded shadow-sm">
				<div class="board_title"><c:out value="${boardDetail.title}" /></div>
				<div class="board_info_box">
					<span class="board_author"><c:out value="${boardDetail.writer}" /></span> 
					<span class="board_date"><c:out value="${boardDetail.regDate}" /></span>
				</div>
				<div class="board_content">${boardDetail.content}</div>
				<div class="board_tag">TAG : <c:out value="${boardDetail.tag}" /></div>
				<div class="board_viewCtn">조회수 : <c:out value="${boardDetail.viewCnt}" /></div>
			</div>
			<div style="margin-top: 20px">
				<button type="button" class="btn btn-sm btn-primary" id="update_btn">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="delete_btn">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="list_btn">목록</button>
			</div>
		</div>
	</article>
</body>
</html>