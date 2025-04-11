<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.*"%>
<%@ page import="dto.*"%>
<%
	String cashDate = request.getParameter("cashDate");
	int cashNo = Integer.valueOf(request.getParameter("cashNo"));
	String kind = request.getParameter("kind");
	String memo = request.getParameter("memo");
	String title = request.getParameter("title");
	int amount = Integer.valueOf(request.getParameter("amount"));
	
	Cash c = new Cash();
	c.setCashDate(cashDate);
	c.setMemo(memo);
	c.setAmount(amount);
	c.setCashNo(cashNo);
	
	CashDao cd = new CashDao();
	cd.updateCash(c);
	
	response.sendRedirect("/cashbook/dateList.jsp?cashDate="+cashDate);
%>