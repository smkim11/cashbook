<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="dto.*"%>
<%@ page import="java.util.*"%>
<%
	String ID = (String)(session.getAttribute("ID"));
	if(ID == null){ // 로그아웃 상태 일때
		response.sendRedirect("/cashbook/index.jsp");
		return;
	}
	
	int cnum = Integer.valueOf(request.getParameter("cnum"));
	
	CategoryDao cd = new CategoryDao();
	Category c = cd.selectCategoryOne(cnum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>제목 수정</h1>
	<form action="/cashbook/category/updateCategoryTitleAction.jsp" method="post">
		<table>
			<tr>
				<th>번호</th>
				<td><input type="text" name="cnum" value="<%=cnum%>" readonly></td>
			</tr>
			<tr>
				<th>종류</th>
				<td>
					<%
						if(c.getKind().equals("수입")){
					%>
							<input type="radio" name="kind" value="수입" checked> 수입
							<input type="radio" name="kind" value="지출"> 지출
					<% 
						}else{
					%>
							<input type="radio" name="kind" value="수입"> 수입
							<input type="radio" name="kind" value="지출" checked> 지출
					<% 
						}
					%>
					
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="<%=c.getTitle()%>"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>