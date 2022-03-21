<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).on('click', "#search_btn", function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/user/getUserList";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword" + $('#keyword').val();
		console.log(url);
		location.href = url;
	});
	
	// 이전 버튼 함수
	function fnPrev(page, range, rangeSize, searchType, query) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url = "${pageContext.request.contextPath}/user/getUserList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&query=" + query;
		location.href = url;
	}
	
	// 페이지 번호 클릭 함수
	function fnPageUtils(page, range, rangeSize, searchType, query) {
		var url = "${pageContext.request.contextPath}/user/getUserList";
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
		
		var url = "${pageContext.request.contextPath}/user/getUserList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&query=" + query;
		
		location.href = url;
	}
	
</script>
</head>
<body>
<article>
	<div class="container">
		<h2>User list</h2>
		
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<colgroup>
					<col style="width:auto;" />
					<col style="width:25%;" />
					<col style="width:25%;" />
					<col style="width:15%;" />
					<col style="width:15%;" />
				</colgroup>
				<thead>
					<tr>
						<th>USER ID</th>
						<th>USER NAME</th>
						<th>EMAIL</th>
						<th>GRADE</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ !empty userList }">
							<c:forEach var="list" items="${userList}">
								<tr>
									<td><c:out value="${list.uno}"></c:out></td>
									<td><c:out value="${list.name}"></c:out></td>
									<td><c:out value="${list.email}"></c:out></td>
									<td><c:out value="${list.grade}"></c:out></td>
									<td><c:out value="${list.regdate}"></c:out></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>			
				</tbody>	
			</table>
		</div>
	<!-- pagination -->
	<!-- 
	 -->
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
					<option value="title"<c:if test="${searchType == 'uno'}">selected='selected'</c:if>>아이디</option>
					<option value="content"<c:if test="${searchType == 'name'}">selected='selected'</c:if>>이름</option>
					<option value="writer"<c:if test="${searchType == 'email'}">selected='selected'</c:if>>이메일</option>
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