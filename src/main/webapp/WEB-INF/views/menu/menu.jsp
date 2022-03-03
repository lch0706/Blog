<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="insertURL" value="/restMenu/insertMenu"></c:url>
<c:url var="deleteURL" value="/restMenu/deleteMenu"></c:url>
<c:url var="updateURL" value="/restMenu/updateMenu"></c:url>
<c:url var="getMenuListURL" value="/restMenu/getMenuList"></c:url>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Menu List</title>
<script>

	$(document).ready(function(){
		fnMenuList();
		fnMenuInsert();
	});
	
	function fnMenuList() {
		var paramData = {}; 
			$.ajax({ url : "${getMenuListURL}" ,
				type : "POST" ,
				dataType : "json" ,
				data : paramData ,
				success : function(result){ 
					console.log(result); 
					if (result.status == "OK"){ 
						if ( result.menuList.length > 0 ) { 
							var list = result.menuList; 
							var htmls = ""; 
							result.menuList.forEach(function(e) { 
								htmls += '<tr>';
								htmls += '<td>' + e.mno + '</td>';
								htmls += '<td>' + e.code + '</td>';
								htmls += '<td>' + e.codename + '</td>';
								htmls += '<td>' + e.sort_num + '</td>';
								htmls += '<td>' + e.comment + '</td>';
								htmls += '</tr>'; 
							});
						} 
					} else { 
								console.log("조회실패");
					} 
					$('#menuList').html(htmls);
				} 
			});
	} // end fnMenuList
	
	function fnMenuInsert() {
		$('#insert_btn').click(function(){
			
			var url ="${insertURL}";
			
			var paramData = {
					"code" : $("#code").val(),
					"codename" : $("#codename").val(),
					"sort_num" : $("#sort_num").val(),
					"comment" : $("#comment").val()
			};
			
			$.ajax({
				url : url,
				type : "post",
				data : paramData,
				success : function(result){
					fnMenuList();
					// 초기화 이벤트
					$("#init_btn").trigger("click");
					
				}
			});
			$(document).on("click", "#init_btn", function(){
				$('#mno').val(''); 
				$('#code').val(''); 
				$('#codename').val(''); 
				$('#sort_num').val(''); 
				$('#comment').val('');
			});
			
		});
	} // end fnMenuInsert
	
</script>
<style>
#paginationBox {
	padding: 10px 0px;
}
</style>
</head>
<body>
	<article>
		<div class="container">
			<!-- Menu form -->
			<h4 class="mb-3">Menu Info</h4>
			<div>
				<form:form name="form" id="form" role="form" modelAttribute="menu" method="post" action="${pageContext.request.contextPath}/menu/insertMenu">
					<form:hidden path="mno" id="mno" />
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="code">Code</label>
							<form:input path="code" id="code" class="form-control"
								placeholder="" value="" required="" />
							<div class="invalid-feedback">Valid Code is required.</div>
						</div>
						<div class="col-md-5 mb-3">
							<label for="codename">Code name</label>
							<form:input path="codename" class="form-control" id="codename"
								placeholder="" value="" required="" />
							<div class="invalid-feedback">Valid Code name is required.
							</div>
						</div>
						<div class="col-md-3 mb-3">
							<label for="sort_num">Sort</label>
							<form:input path="sort_num" class="form-control" id="sort_num"
								placeholder="" required="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 mb-3">
							<label for="comment">Comment</label>
							<form:input path="comment" class="form-control" id="comment"
								placeholder="" value="" required="" />
						</div>
					</div>
				</form:form>
			</div>
			<!-- End Menu form -->
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="insert_btn">등록</button>
				<button type="button" class="btn btn-sm btn-primary" id="delete_btn">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="init_btn">초기화</button>
			</div>
			<h4 class="mb-3" style="padding-top: 15px">Menu List</h4>
			<!-- List -->
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: 15%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: auto;" />
					</colgroup>
					<thead>
						<tr>
							<th>menu id</th>
							<th>code</th>
							<th>codename</th>
							<th>sort</th>
							<th>comment</th>
						</tr>
					</thead>
					<tbody id="menuList">
					</tbody>
				</table>
			</div>
			<!-- End List -->
		</div>
	</article>
</body>
</html>

