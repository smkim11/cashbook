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
	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.valueOf(request.getParameter("currentPage"));
	}
	int rowPerPage = 5;
	Paging p = new Paging();
	p.setCurrentPage(currentPage);
	p.setRowPerPage(rowPerPage);
	
	CategoryDao cd = new CategoryDao();
	ArrayList<Category> list = cd.selectCategory(p);
	
	int lastPage = p.getLastPage(cd.totalCategory());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>수입 지출 리스트</h1>
	<a href="/cashbook/category/insertCategoryForm.jsp">추가</a>
	<table>
		<tr>
			<th>번호</th>
			<th>종류</th>
			<th>제목</th>
			<th>날짜</th>
			<th colspan="2">변경</th>
		</tr>
		<%
			for(Category c : list){
		%>
				<tr>
					<td><%=c.getCategoryNo() %></td>
					<td><%=c.getKind() %></td>
					<td><%=c.getTitle() %></td>
					<td><%=c.getCreatedate() %></td>
					<td><a href="/cashbook/category/updateCategoryTitleForm.jsp?cnum=<%=c.getCategoryNo() %>">수정</a></td>
					<td><a href="/cashbook/category/deleteCategory.jsp?cnum=<%=c.getCategoryNo() %>">삭제</a></td>
				</tr>
		<%
			}
		%>
	</table>
	<%
		if(currentPage>1){
	%>	
			<a href="/cashbook/category/categoryList.jsp?currentPage=1">[처음]</a>
			<a href="/cashbook/category/categoryList.jsp?currentPage=<%=currentPage-1%>">[이전]</a>
	<% 
		}
	%>
	<%=currentPage %>/<%=lastPage %>
	<%
		if(currentPage<lastPage){
	%>	
			<a href="/cashbook/category/categoryList.jsp?currentPage=<%=currentPage+1%>">[다음]</a>
			<a href="/cashbook/category/categoryList.jsp?currentPage=<%=lastPage%>">[마지막]</a>
	<% 
		}
	%>
</body>
</html>