<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ID = (String)(session.getAttribute("ID"));
	if(ID == null){ // 로그아웃 상태 일때
		response.sendRedirect("/cashbook/index.jsp");
		return;
	}
	
	String cashDate = request.getParameter("cashDate");
	String kind = request.getParameter("kind");
	String memo = request.getParameter("memo");
	String title = request.getParameter("title");
	int amount = Integer.valueOf(request.getParameter("amount"));
	int cashNo = Integer.valueOf(request.getParameter("cashNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		if(kind.equals("지출")){
	%>
			<h1>지출 수정</h1>
	<% 
		}else{
	%>
			<h1>수입 수정</h1>
	<% 
		}
	%>
	<form method="post" action="/cashbook/cash/updateCashAction.jsp">
	<table border ="1">
	<input type="hidden" name=cashNo value="<%=cashNo %>" >
	<input type="hidden" name=kind value="<%=kind %>" >
		<tr>
			<th>날짜</th>
			<td><input type="date" name="cashDate" value="<%=cashDate %>" ></td>
		</tr>
		<tr>
			<th>분류</th>
			<td><input type="text" name="title" value="<%=title %>" readonly></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="number" name="amount" value="<%=amount %>" ></td>
		</tr>
		<tr>
			<th>메모</th>
			<td><textarea name="memo"><%=memo %></textarea></td>
		</tr>
	</table>
	<button type="submit">수정</button>
	</form>
</body>
</html>