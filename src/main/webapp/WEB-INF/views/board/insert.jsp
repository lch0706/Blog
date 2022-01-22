<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri ="http://www.springframework.org/tags/form" %> 

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
	$(document).on('click', '#save_btn', function(e){
		e.preventDefault();
		$("#f").submit();
	});
	$(document).on('click', '#list_btn', function(e){
		e.preventDefault();
		location.href="${pageContext.request.contextPath}/board/getBoardList";
	});
	$(document).ready(function(){
		var mode = '<c:out value="${mode}"/>';
		if ( mode == 'update'){
			//입력 폼 셋팅
			$("#writer").prop('readonly', true);
			$("input:hidden[name='bno']").val(<c:out value="${boardDetail.bno}"/>);
			$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
			$("#writer").val('<c:out value="${boardDetail.writer}"/>');
			$("#title").val('<c:out value="${boardDetail.title}"/>');
			$("#content").val('<c:out value="${boardDetail.content}"/>');
			$("#tag").val('<c:out value="${boardDetail.tag}"/>');
		}
	});
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
			<h2>board Insert</h2>
			<form:form name="form" id="f" role="form" modelAttribute="board" method="post" action="${pageContext.request.contextPath}/board/saveBoard">
				<form:hidden path="bno" />
				<input type="hidden" name="mode" />
				
				<div class="mb-3">
					<label for="title">카테고리</label>
					<form:input path="cateCd" class="form-control" id="cateCd" placeholder="카테고리를 입력해 주세요" />
				</div>
				
				<div class="mb-3">
					<label for="title">제목</label>
					<form:input path="title" class="form-control" id="title" placeholder="제목을 입력해 주세요" />
				</div>
				
				
				<div class="mb-3">
					<label for="writer">작성자</label>
					<form:input path="writer" class="form-control" id="writer" placeholder="이름을 입력해 주세요" />
				</div>
				
				<div class="mb-3">
					<label for="content">내용</label>
					<form:textarea path="content" class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" />
				</div>
				
				<div class="mb-3">
					<label for="tag">TAG</label>
					<form:input path="tag" class="form-control"  id="tag" placeholder="태그를 입력해 주세요" />
				</div>
			</form:form>
			<div >
				<button type="button" class="btn btn-sm btn-primary" id="save_btn">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="list_btn">목록</button>
			</div>
		</div>
	</article>
</body>
</html>