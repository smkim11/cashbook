<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ID = (String)(session.getAttribute("ID"));
	if(ID == null){ // 로그아웃 상태 일때
		response.sendRedirect("/cashbook/index.jsp");
		return;
	}
	
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
	<h1>영수증 등록</h1>
	<form method="post" action="/cashbook/cash/insertReceitAction.jsp" enctype="multipart/form-data">
	<input type="hidden" name="cashNo" value="<%=cashNo %>">
	<input type="hidden" name="kind" value="<%=kind %>">
		<table border="1">
			<tr>
				<th>영수증</th>
				<td><input type="file" name="receit"></td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>