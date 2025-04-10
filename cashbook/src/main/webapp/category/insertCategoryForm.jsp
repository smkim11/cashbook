<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ID = (String)(session.getAttribute("ID"));
	if(ID == null){ // 로그아웃 상태 일때
		response.sendRedirect("/cashbook/index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>수입 지출 리스트 추가</h1>
	<form method="post" action="/cashbook/category/insertCategoryAction.jsp">
	<table>
		<tr>
			<th>종류</th>
			<td>
				<input type="radio" name="kind" value="수입"> 수입
				<input type="radio" name="kind" value="지출"> 지출
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title"></td>
		</tr>
	</table>
	<button type="submit">추가</button>
	</form>
</body>
</html>