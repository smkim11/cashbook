<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.*"%>
<%@ page import="dto.*"%>
<%
	int cashNo = Integer.valueOf(request.getParameter("cashNo"));
	String kind = request.getParameter("kind");
	
	CashDao cd = new CashDao();
	ArrayList<HashMap<String,Object>> list = cd.selectCashByNo(cashNo);
	
	ReceitDao rd = new ReceitDao();
	Receit r = rd.selectReceit(cashNo);
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
	<%
		if(kind.equals("지출")){
	%>
			<h1>지출 상세보기</h1>
	<% 
		}else{
	%>
			<h1>수입 상세보기</h1>
	<% 
		}
	%>
	
	<%
		for(HashMap<String,Object> map : list){
	%>
	<a href="/cashbook/cash/updateCashForm.jsp?cashDate=<%=map.get("cashDate") %>&kind=<%=kind%>&title=<%=map.get("title") %>&amount=<%=map.get("amount") %>&memo=<%=map.get("memo") %>&cashNo=<%=cashNo%>">수정</a>||
	<a href="/cashbook/cash/deleteCashForm.jsp?cashNo=<%=cashNo %>&kind=<%=kind%>">삭제</a>||
	<a href="/cashbook/cash/insertReceitForm.jsp?cashNo=<%=cashNo %>&kind=<%=kind%>">영수증 등록</a>
	<%
		if(r.getFileName()!=null){
	%>
			||<a href="/cashbook/cash/deleteReceitForm.jsp?cashNo=<%=cashNo %>&kind=<%=kind%>">영수증 삭제</a>
	<% 
		}
	%>
	
			<table border ="1">
				<tr>
					<th>날짜</th>
					<td><%=map.get("cashDate") %></td>
				</tr>
				<tr>
					<th>분류</th>
					<td><%=map.get("title") %></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><%=map.get("amount") %></td>
				</tr>
				<tr>
					<th>메모</th>
					<td><%=map.get("memo") %></td>
				</tr>
			</table>
	<%
		}
	%>
	<table border="1">
		<tr>
			<th>영수증</th>
		</tr>
		<tr>
			<td><img src="/cashbook/upload/<%=r.getFileName() %>"></td>
		</tr>
	</table>
</body>
</html>