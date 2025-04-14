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
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body {
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f9fcff;
		margin: 0;
	}

	.page-content {
		padding-top: 70px;
	}

	h1 {
		text-align: center;
		color: #0A9AE0;
		margin-bottom: 30px;
	}

	.container {
		max-width: 900px;
		margin: auto;
	}

	.table {
		background-color: #fff;
		border-radius: 8px;
		overflow: hidden;
		box-shadow: 0 4px 10px rgba(0,0,0,0.05);
	}

	a {
		text-decoration: none;
		color: #0A9AE0;
		font-weight: bold;
	}
</style>

<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:include page="/nav/nav.jsp" />
<div class="page-content">
<div class="container">
	<h1>수입 지출 리스트</h1>
	<div class="mb-3 text-end">
		<a href="/cashbook/category/insertCategoryForm.jsp">추가</a>
	</div>
	<table class="table table-bordered text-center align-middle">
		<thead class="table-light">
			<tr>
				<th>번호</th>
				<th>종류</th>
				<th>제목</th>
				<th>날짜</th>
				<th colspan="2">변경</th>
			</tr>
		</thead>
		<tbody>
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
		</tbody>
	</table>
	<div class="text-center mt-4">
		<%
			if(currentPage>1){
		%>	
				<a class="page-link d-inline-block" href="/cashbook/category/categoryList.jsp?currentPage=1">[처음]</a>
				<a class="page-link d-inline-block" href="/cashbook/category/categoryList.jsp?currentPage=<%=currentPage-1%>">[이전]</a>
		<% 
			}
		%>
		<%=currentPage %>/<%=lastPage %>
		<%
			if(currentPage<lastPage){
		%>	
				<a class="page-link d-inline-block" href="/cashbook/category/categoryList.jsp?currentPage=<%=currentPage+1%>">[다음]</a>
				<a class="page-link d-inline-block" href="/cashbook/category/categoryList.jsp?currentPage=<%=lastPage%>">[마지막]</a>
		<% 
			}
		%>
	</div>
</div>
</div>
</body>
</html>