<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h1>비밀번호 변경</h1>
	<form action="/cashbook/login/updateAdminPwAction.jsp" method="post">
	<table class="w-75 table table-striped table-bordered table-hover">
		<input type="hidden" name="id" value="admin">
		<tr>
			<th>기존 비밀번호</th>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<th>변경 비밀번호</th>
			<td><input type="password" name="newpw"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="newpw2"></td>
		</tr>
	</table>
	<button type="submit">변경</button>	
	</form>
</body>
</html>