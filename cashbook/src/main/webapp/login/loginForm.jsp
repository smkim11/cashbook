<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ID = (String)(session.getAttribute("ID"));
	if(ID != null){ // 로그인 상태 일때
		response.sendRedirect("/cashbook/index.jsp");
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
	<table class="w-25 table table-hover">
		<input type="hidden" name="id" value="admin">
		<tr>
			<th>비밀번호</th>
			<td><input class="form-control" type="password" name="pw"></td>
		</tr>
	</table>
	<a href="/cashbook/login/updateAdminPwForm.jsp">비밀번호 변경</a><br>
	<button type="submit" class="btn btn-primary">로그인</button>	
	</form>
</body>
</html>