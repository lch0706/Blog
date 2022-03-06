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
		fnMenuInsert_Modify();
		fnMenuInfo();
		fnMenuDelete();
		fnInit();
		
	});
	
	function fnMenuList() {
		var paramData = {}; 
		
			$.ajax({ 
				url : "${pageContext.request.contextPath}/restMenu/getMenuList",
				type : 'post',
				dataType : 'json',
				data : paramData,
				success : function(result){ 
					console.log(result);
					
					if (result.status == "OK"){ 
						if ( result.menuList.length > 0) { 
							var list = result.menuList; 
							var htmls = ""; 
							result.menuList.forEach(function(e) { 
								htmls += '<tr>';
								htmls += '<td>' + e.mno + '</td>';
								htmls += '<td>';
								htmls += '<a href="#" onClick="fnMenuInfo(' + e.mno + ',\'' + e.code + '\', \'' + e.codename + '\', ' + e.sort_num + ', \'' + e.comment + '\')">';
								htmls += e.code;
								htmls += '</a>';
								htmls += '</td>';
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
	
	function fnMenuInsert_Modify() {
		$('#insert_btn').click(function(){
			
			var url = "${pageContext.request.contextPath}/restMenu/insertMenu";
			
			var paramData = JSON.stringify({
				"code" : $("#code").val(),
				"codename" : $("#codename").val(),
				"sort_num" : $("#sort_num").val(),
				"comment" : $("#comment").val()
			});
			
			if ($("#mno").val() != 0) {
				var url = "${pageContext.request.contextPath}/restMenu/updateMenu";
			}
			
			var paramData = JSON.stringify({
				"code" : $("#code").val(),
				"codename" : $("#codename").val(),
				"sort_num" : $("#sort_num").val(),
				"comment" : $("#comment").val()
			});
			
			$.ajax({
				url : url,
				type : 'post',
				data : paramData,
				contentType: 'application/json',
				dataType: 'json',
				success : function(result){
					if (result.status == "OK") {
						alert('등록 되었습니다');
						fnInit();
						fnMenuList();
					} else {
						alert('등록을 실패했습니다.');
					}
					// 초기화 이벤트
					//$("#init_btn").trigger("click");
				}
			});
			/*
			$(document).on("click", "#init_btn", function(){
				$('#mno').val(''); 
				$('#code').val(''); 
				$('#codename').val(''); 
				$('#sort_num').val(''); 
				$('#comment').val('');
				$('#code').attr("readonly", false);
			});
			*/
			
		});
	} // end fnMenuInsert
	
	function fnMenuDelete(){
		$("#delete_btn").click(function(){
			if ($("#code").val() == "") {
				alert("삭제할 코드를 선택해 주세요.");
				return;
			}
			
			var url = "${pageContext.request.contextPath}/restMenu/deleteMenu";
			
			var paramData = {
					"code" : $("#code").val()
			};
			
			$.ajax({
				url : url,
				type : 'post',
				dataType : 'json',
				data : paramData,
				success : function(result){
					fnMenuList();
					// 삭제 후 세팅값 초기화
					fnInit();
				}
				
			});
		});
	}
	
	function fnInit() {
		$("#init_btn").click(function(){
			$('#mno').val(''); 
			$('#code').val(''); 
			$('#codename').val(''); 
			$('#sort_num').val(''); 
			$('#comment').val('');
			$('#code').attr("readonly", false);
			
		});
	}
	
	function fnMenuInfo(mno, code, codename, sort_num, comment) {
		$('#mno').val(mno); 
		$('#code').val(code); 
		$('#codename').val(codename); 
		$('#sort_num').val(sort_num); 
		$('#comment').val(comment);
		
		//코드 부분 읽기 모드로 전환 
		//$("#code").attr("readonly", true);

	} // end fnMenuInfo
	
	
	
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
								placeholder="" value="" required="" />
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

