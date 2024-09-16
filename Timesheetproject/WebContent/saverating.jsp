<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
try{
	int taskid=Integer.parseInt(request.getParameter("hide"));
	System.out.print(taskid+" task id update rating field jhvjhvdkjbkjvkbvjk");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheet", "root", "55555");
	PreparedStatement ps = c.prepareStatement("update task set rating=? where taskid=?");
	ps.setString(1, request.getParameter("rating"));
	ps.setInt(2 , taskid);
	 int i = ps.executeUpdate();
	    if (i != 0) {
	        response.sendRedirect("manager.jsp");
	    } else {
	        response.sendRedirect("./");
	    }
}catch(Exception e){
	System.out.print(e);
}
%>
</body>
</html>