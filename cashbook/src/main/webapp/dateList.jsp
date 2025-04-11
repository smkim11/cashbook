<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.*"%>
<%@ page import="dto.*"%>
<%
	String ID = (String)(session.getAttribute("ID"));
	if(ID == null){ // 로그아웃 상태 일때
		response.sendRedirect("/cashbook/index.jsp");
		return;
	}
	
	String cashDate = request.getParameter("cashDate");
	
	CashDao cd = new CashDao();
	ArrayList<HashMap<String,Object>> list = cd.selectCashByDate(cashDate);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div>
	<jsp:include page="/nav/nav.jsp"></jsp:include>
</div><br>
	<h1><%=cashDate %> 수입 지출</h1>
	<form method="post" action="/cashbook/cash/insertCashForm.jsp">
		<input type="hidden" name="cashDate" value="<%=cashDate%>">
		<button type="submit">추가</button>
	</form>
	<table>
		<tr>
			<th>종류</th>
			<th>제목</th>
			<th>가격</th>
			<th>메모</th>
		</tr>
			<% 
				for(HashMap<String,Object> m : list){
			%>
					<tr>
						<td style='color:<%=m.get("color")%>'><%=m.get("kind") %></td>
						<td style='color:<%=m.get("color")%>'><%=m.get("title") %></td>
						<td style='color:<%=m.get("color")%>'><%=m.get("amount") %></td>
						<td style='color:<%=m.get("color")%>'>
							<a href="/cashbook/cash/cashOne.jsp?cashNo=<%=m.get("cashNo")%>&kind=<%=m.get("kind") %>"><%=m.get("memo") %></a>
						</td>
					</tr>
			<% 
				}
			%>
			
			
	</table>
</body>
</html>