<%@page import="com.bean.Userbeans"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Userbeans bean = (Userbeans) session.getAttribute("obj");
//int empid = Integer.parseInt(request.getParameter("empid"));
//System.out.print(empid);
//session.setAttribute("empid", empid);
System.out.print(bean.getId());
%>
<div style="text-align: center;">
<h1>Employee Panel</h1><hr><br>
	<a href="completetask.jsp" style="font-size: larger;">Completed Tasks</a><br><br>
	<a href="remaningtask.jsp" style="font-size: larger;">Remaining Tasks</a><br><br>
 	<a href="index.jsp" style="padding: 5px 10px;font-size: larger;">Log out</a>
 </div>
</body>
</html>