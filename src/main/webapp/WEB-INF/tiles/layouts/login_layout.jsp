<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<!-- common CSS -->
<link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>">
<!-- Custom styles for this template --> 
<link rel="stylesheet" href="<c:url value='/resources/common/css/signin.css'/>" >
<style>
	body{
		padding : 0px;
	}
	#tile_body {
		width : 100%;
		float : left;
	}
</style>
</head>
<body class="text-center">
	<div id="tile_body"><tiles:insertAttribute name="tile_body" ignore="true" /></div>
</body>
</html>