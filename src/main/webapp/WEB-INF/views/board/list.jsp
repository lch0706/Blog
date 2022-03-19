<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<script>

	// 글 작성 함수
	$(document).on('click', '#insert_btn', function(e){
		loginUser = "${loginUser}"
		if (loginUser == "") {
			alert("로그인 후 이용하실 수 있습니다.")
			location.href= "${pageContext.request.contextPath}/login/loginForm"
		} else if (loginUser != "") {
			console.log(loginUser)
			location.href= "${pageContext.request.contextPath}/board/boardForm"
		}

	});
	// 글 상세보기 함수
	function fnBoardDetail(bno){
		let url = "${pageContext.request.contextPath}/board/getBoardDetail";
		url = url + "?bno=" + bno;
		location.href = url;
	} // end fnBoardDetail
	
	// 이전 버튼 함수
	function fnPrev(page, range, rangeSize, searchType, query) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url = "${pageContext.request.contextPath}/board/getBoardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&query=" + query;
		location.href = url;
	}
	
	// 페이지 번호 클릭 함수
	function fnPageUtils(page, range, rangeSize, searchType, query) {
		var url = "${pageContext.request.contextPath}/board/getBoardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&query=" + query;
		location.href = url;
	}
	
	// 다음버튼 클릭 함수
	function fnNext(page, range, rangeSize, searchType, query) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		
		var url = "${pageContext.request.contextPath}/board/getBoardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&query=" + query;
		location.href = url;
	}
	
	// 검색 함수
	$(document).on('click', '#search_btn', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/board/getBoardList";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&query=" + $('#query').val();
		location.href = url;
	});
</script>

<body>
<article>
	<div class="container">
		<div class="table-responsive">
		<h2>board list</h2>
			<table class="table table-striped table-sm">
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: auto;" />
					<col style="width: 15%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty boardList }">
							<tr>
								<td colspan="5" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty boardList}">
							<c:forEach var="list" items="${boardList}">
								<tr>
									<td><c:out value="${list.bno}" /></td>
									<td><a href="#" onclick="fnBoardDetail(<c:out value="${list.bno}"/>)"><c:out value="${list.title}" /></a></td>
									<td><c:out value="${list.name}" /></td>
									<td><c:out value="${list.viewCnt}" /></td>
									<td><c:out value="${list.regDate}" /></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div>
			<input type="button" class="btn btn-sm btn-primary" id="insert_btn" value="글쓰기"><br><br>
		</div>
	<!-- pagination -->
	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pageUtils.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fnPrev('${pageUtils.page}', '${pageUtils.range}', '${pageUtils.rangeSize}', '${search.searchType}', '${search.query}')">Previous</a></li>
			</c:if>
			<c:forEach begin="${pageUtils.startPage}" end="${pageUtils.endPage}" var="idx">
				<li class="page-item <c:out value="${pageUtils.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fnPageUtils('${idx}', '${pageUtils.range}', '${pageUtils.rangeSize}', '${search.searchType}', '${search.query}')"> ${idx} </a></li>
			</c:forEach>
			<c:if test="${pageUtils.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fnNext('${pageUtils.page}', '${pageUtils.range}', '${pageUtils.rangeSize}', '${search.searchType}', '${search.query}')" >Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- END pagination -->
	<!-- search -->
		<div class="form-group row justify-content-center">
			<div class="w100" style="padding-right:10px">
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="title"<c:if test="${searchType == 'title'}">selected='selected'</c:if>>제목</option>
					<option value="content"<c:if test="${searchType == 'content'}">selected='selected'</c:if>>본문</option>
					<option value="name"<c:if test="${searchType == 'name'}">selected='selected'</c:if>>작성자</option>
				</select>
			</div>
			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="query" id="query" value="${query}">
			</div>
			<div>
				<button class="btn btn-sm btn-primary" name="search_btn" id="search_btn">검색</button>
			</div>
		</div>
	<!-- END search -->
	</div>	
</article>
</body>
</html>



