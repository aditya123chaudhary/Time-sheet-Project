<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align: center">Admin Panel</h1><hr><br>
<%
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheet", "root", "55555");
		PreparedStatement ps = c.prepareStatement("select * from company where role='2'");
		rs = ps.executeQuery();
	} catch (Exception e) {
		System.out.print(e);
	}
	%>
	<table border="1" cellpadding="5" align="center">
		<tr>
			<th>Name</th>
			<th>Mobile no</th>
			<th>Password</th>
			<th>Role</th>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%="Manager"%></td>
		</tr>
		<%
		}
		%>
</table><br>
<div style="text-align: center;">
	<a href="index.jsp">LOGOUT</a><br><br>
	<a href="addadmin.jsp">ADD MANAGERS</a>
</div>
</body>
</html>