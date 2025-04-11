<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int cashNo = Integer.valueOf(request.getParameter("cashNo"));
	String kind = request.getParameter("kind");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>영수증 삭제</h1>
	<form action="/cashbook/cash/deleteReceitAction.jsp">
	<input type="hidden" name="cashNo" value="<%=cashNo%>">
	<input type="hidden" name="kind" value="<%=kind%>">
		<table border = "1">
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass"></td>
			</tr>
		</table>
		<button type="submit">삭제</button>
	</form>
</body>
</html>