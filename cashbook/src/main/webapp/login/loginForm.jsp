<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ID = (String)(session.getAttribute("ID"));
	if(ID != null){ // 로그인 상태 일때
		response.sendRedirect("/cashbook/categoryList.jsp");
		return;
	}
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
	<h1>로그인</h1>
	<form action="/cashbook/login/loginAction.jsp" method="post">
	<table class="w-75 table table-striped table-bordered table-hover">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pw"></td>
		</tr>
	</table>
	<a href="/cashbook/login/updateAdminPwForm.jsp">비밀번호 변경</a><br>
	<button type="submit">로그인</button>	
	</form>
</body>
</html>