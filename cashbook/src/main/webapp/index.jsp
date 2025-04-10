<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ID = (String)(session.getAttribute("ID"));
%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body{
	text-align:center
	}
	
	table{
	margin:auto;
	width: 40%
	}
</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	if(ID == null){
%>
		<a href="/cashbook/login/loginForm.jsp">로그인</a>
<% 
	}else{
%>
		<%=ID %>님 환영합니다.
		<a href="/cashbook/login/logout.jsp">로그아웃</a>
<% 
	}
%><hr>
<h1>메인 페이지</h1>
	<table class="w-75 table table-striped table-bordered table-hover">
		<tr>
			<th>1.</th>
			<td><a href="/cashbook/category/categoryList.jsp">수입 지출 리스트</a></td>
		</tr>
	</table>
</body>
</html>