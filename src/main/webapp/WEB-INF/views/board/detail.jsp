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
		fnReplyList();
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
	
	function fnReplyList(){
		var url = "${pageContext.request.contextPath}/restBoard/getReplyList";
		var paramData = {"bno" : "${boardDetail.bno}"};
		$.ajax({
			type: 'post',
			url: url,
			data: paramData,
			dataType: 'json',
			success: function(result) {
				var htmls = "";
					if(result.length < 1) {
						htmls.push("등록된 댓글이 없습니다.");
					} else {
						$(result).each(function(){
							htmls += '<div class="media text-muted pt-3" id="rno' + this.rno + '">';
						       htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
							   htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
							   htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
							   htmls += '</svg'>;
							   htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		                       htmls += '<span class="d-block">';
			                   htmls += '<strong class="text-gray-dark">' + this.writer + '</strong>';
			                   htmls += '<span style="padding-left: 7px; font-size: 9pt">';
			                   htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rno + ', \'' + this.writer + '\', \'' + this.content + '\' )" style="padding-right:5px">수정</a>';
			                   htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rno + ')" >삭제</a>';
			                   htmls += '</span>';
			                   htmls += '</span>';
			                   htmls += this.content;
			                   htmls += '</p>';
			                   htmls += '</div>';
					});
				}
				${"#replyList"}.html(htmls);	
			}
		});
	} // end fnReplyList
	
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
			<!--  Reply Form -->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<form:form name="form" id="form" role="form" modelAttribute="Reply" method="post">
				<form:hidden path="bno" id="bno" />
				<div class="row">
					<div class="col-sm-10">
						<form:textarea path="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
					</div>
					<div class="col-sm-2">
						<form:input path="regdate" class="form-control" id="regdate" placeholder="댓글 작성자"></form:input>
						<button type="button" class="btn btn-sm btn-primary" id="insert_reply_btn" style="width: 100%; margin-top: 10px">저 장</button>	
					</div>
				</div>	
				</form:form>
			</div>
			<!-- End Reply Form -->	
			
			<!-- Reply List -->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
				<div id="replyList"></div>
			</div>
			<!-- End Reply List -->
		</div>
	</article>
</body>
</html>