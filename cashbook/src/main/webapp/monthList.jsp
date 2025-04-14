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
	
	Calendar c = Calendar.getInstance();
	
	if(request.getParameter("targetMonth") != null){
		c.set(Calendar.MONTH,Integer.valueOf(request.getParameter("targetMonth")));
	}
	
	c.set(Calendar.DATE,1); // 날짜를 1일로 변경
	
	int lastDate = c.getActualMaximum(Calendar.DATE);
	int dayOfWeek = c.get(Calendar.DAY_OF_WEEK); // 요일별 숫자 변환-> 일=1,월=2...
	
	int startBlank = dayOfWeek-1;
	int endBlank = 0;
	int totalCell = startBlank+lastDate+endBlank;
	
	// 전체 칸 개수가 7로 나누어지지 않으면 나누어지도록 endBlank 추가
	if(totalCell % 7 != 0){
		endBlank = 7 - totalCell % 7;
		totalCell = startBlank+lastDate+endBlank;
	}
	
	CashDao cd = new CashDao();
	
	ArrayList<HashMap<String,Object>> list = cd.selectCash(Integer.valueOf(c.get(Calendar.YEAR)),Integer.valueOf(c.get(Calendar.MONTH)+1));
	
	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH)+1;
	DataDao dd = new DataDao();
	ArrayList<HashMap<String,Object>> totalList = dd.selectTotalData();
	ArrayList<HashMap<String,Object>> totalYearList = dd.selectYearData(year);
	ArrayList<HashMap<String,Object>> totalMonthList = dd.selectMonthData(year,month);
	ArrayList<HashMap<String,Object>> totalMonthListByYear = dd.selectMonthDataByYear(year);
%>
<!DOCTYPE html>
<html>
<head>
<style>
	span{
	font-size:14px
	}
	#table1{
		align:right;
	}
</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<jsp:include page="/nav/nav.jsp"></jsp:include>
	</div><br>
	<table id="talbe1" border="1" align="right">
		<tr>
			<th>수입/지출</th>
			<th>개수</th>
			<th>총액</th>
		</tr>
			<%
				for(HashMap<String,Object> m : totalList){
			%>
					<tr>
						<td><%=m.get("kind")%></td>
						<td><%=m.get("cnt")%></td>
						<td><%=m.get("total")%></td>
					</tr>
			<% 
				}
			%>
		<tr>
			<th>연도</th>
			<th>수입/지출</th>
			<th>개수</th>
			<th>총액</th>
		</tr>
			<%
				for(HashMap<String,Object> m : totalYearList){
			%>
					<tr>
						<td><%=m.get("year")%></td>
						<td><%=m.get("kind")%></td>
						<td><%=m.get("cnt")%></td>
						<td><%=m.get("total")%></td>
					</tr>
			<% 
				}
			%>
			<tr>
			<th>월</th>
			<th>수입/지출</th>
			<th>개수</th>
			<th>총액</th>
		</tr>
			<%
				for(HashMap<String,Object> m : totalMonthList){
			%>
					<tr>
						<td><%=m.get("month")%></td>
						<td><%=m.get("kind")%></td>
						<td><%=m.get("cnt")%></td>
						<td><%=m.get("total")%></td>
					</tr>
			<% 
				}
			%>
			<th>년.월</th>
			<th>수입/지출</th>
			<th>개수</th>
			<th>총액</th>
		</tr>
			<%
				for(HashMap<String,Object> m : totalMonthListByYear){
			%>
					<tr>
						<td><%=year%>.<%=m.get("month")%></td>
						<td><%=m.get("kind")%></td>
						<td><%=m.get("cnt")%></td>
						<td><%=m.get("total")%></td>
					</tr>
			<% 
				}
			%>
	</table>
	
	<h1><%=c.get(Calendar.YEAR) %>년 <%=c.get(Calendar.MONTH)+1 %>월</h1>
	<div>
	<a href="/cashbook/monthList.jsp?targetMonth=<%=c.get(Calendar.MONTH)-1%>">[이전달]</a>
	<a href="/cashbook/monthList.jsp?targetMonth=<%=c.get(Calendar.MONTH)+1%>">[다음달]</a>
	</div>
	<table border="1" width="80%">
		<tr>
			<th style="color:red";>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th style="color:blue";>토</th>
		</tr>
		<tr>
			<%
				for(int i=1;i<=totalCell;i++){
			%>
					<td style="width:100px; height:80px; vertical-align:top; text-align:right;">
					<%
						if(i-startBlank>0 && i-startBlank<=lastDate){
							
					%>	
					<%
							String mon = String.format("%02d", c.get(Calendar.MONTH) + 1);
							String date = String.format("%02d", i-startBlank);
					%>
							<a href="/cashbook/dateList.jsp?cashDate=<%=c.get(Calendar.YEAR)%>-<%=mon%>-<%=date %>"><%=i-startBlank %></a><br>
							<%
								for(HashMap<String,Object> m : list){
							%>
									<%
										if(Integer.valueOf(String.valueOf(m.get("cashDate")).substring(8))==i-startBlank){
									%>
											<%
												if(m.get("kind").equals("지출")){
											%>
													<span style="color:red"><%=m.get("title")%><br><%=m.get("amount") %>원</span><br>
											<% 
												}else{
											%>
													<span style="color:blue"><%=m.get("title")%><br><%=m.get("amount") %>원</span><br>
											<% 
												}
											%>
											
									<% 
										}
									%>
							<% 
								}
							%>
							
								
					<% 
						}else{
					%>
							<%="" %>
					<% 
						}
					%>
					</td>
				<%
					if(i%7==0){
				%>
						</tr><tr>
				<% 
					}
				%>
			<% 
				}
			%>
		</table>
</body>
</html>