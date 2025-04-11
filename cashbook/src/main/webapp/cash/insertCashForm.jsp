<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.*"%>
<%@ page import="dto.*"%>
<%
	// dateList.jsp -> 수입 지출 입력 버튼(0000-00-00) ->
	String cashDate = request.getParameter("cashDate");
	
	// insertCashForm-> kind 선택(String kind)
	String kind = request.getParameter("kind");
	if(kind == null){
		kind="";
	}
	
	ArrayList<Category> list = new ArrayList<>();
	if(kind!=null){// insertCashForm에서 kind 선택 후 재요청
		// DB에서 선택된 kind에 해당하는 title목록
		CategoryDao cd = new CategoryDao();
		list = cd.selectCategoryListByKind(kind);
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>수입 지출 선택</h1>
	<form method="post" action="/cashbook/cash/insertCashForm.jsp">
		<table border="1">
		<input type="hidden" name="cashDate" value="<%=cashDate%>">
			<tr>
				<th>종류</th>
				<td>
					<select name="kind">
						<%
							if(kind.equals("수입")){
						%>
								<option value="">::선택::</option>
								<option value="수입" selected>수입</option>
								<option value="지출">지출</option>
						<% 
							}else if(kind.equals("지출")){
						%>
								<option value="">::선택::</option>
								<option value="수입">수입</option>
								<option value="지출" selected>지출</option>
						<% 
							}else{
						%>
								<option value="">::선택::</option>
								<option value="수입">수입</option>
								<option value="지출">지출</option>
						<% 
							}
						%>
					</select>
				</td>
			</tr>
		</table>
		<button type="submit">선택</button>
	</form>
	<hr>
	
	<h1>수입 지출 추가</h1>
	<form method="post" action="/cashbook/cash/insertCashAction.jsp">
		<table border="1">
		<tr>
			<th>날짜</th>
			<td><input type="text" name="cashDate" value="<%=cashDate%>" readonly></td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td>
				<select name="categoryNo">
					<%
						if(list != null){
							for(Category ct : list){
					%>
								<option value="<%=ct.getCategoryNo()%>"><%=ct.getTitle() %></option>
					<%	
							}
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<th>금액</th>
			<td><input type="number" name="amount"></td>
		</tr>
		<tr>
			<th>메모</th>
			<td><textarea name="memo"></textarea></td>
		</tr>
		<tr>
			<th>색</th>
			<td><input type="color" name="color"></td>
		</tr>
		</table>
		<button type="submit">입력</button>
	</form>
</body>
</html>