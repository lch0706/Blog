<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function fnSignupClick() {
		location.href ="${pageContext.request.contextPath}/user/signupForm";
	}
</script>
</head>
<body>

	<!-- login form -->
	<form:form class="form-signin" name="form" id="form" role="form" modelAttribute="user" method="post" action="${pageContext.request.contextPath}/board/saveBoard">
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">CHANGHWAN.COM</h1>
		</div>
		
		<div class="form-label-group">
			<form:input path="uno" id="uno" class="form-control" placeholder="User ID" required="" autofocus="" />
			<label for="uno" class="sr-only">User ID</label>
		</div>
		
		<div class="form-label-group">
			<form:input path="uno" id="uno" class="form-control" placeholder="User Password" required="" autofocus="" />
			<label for="uno" class="sr-only">User Password</label>
		</div>
		
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		
		<span style="font-size:11pt;">Sign up</span>
		
		<p class="mt-5 mb-3 text-muted text-center">© 2022. CHANGHWAN. All rights reserved.</p>
	</form:form>	
	<!-- end login form  -->

</body>
</html>