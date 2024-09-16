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
<form action="saveemp.jsp" method="post" style="text-align: center;">
	<h1>Employee Page</h1><hr><br><br>

		<label style="display: block; margin-right: 135px;">Name:</label>
			<input type="text" name="name" placeholder="Enter name ..."><br><br>
			
		<label style="display: block; margin-right: 115px;">Mobile no:</label>
			<input type="text"name="mobileno" placeholder="Enter moblienumber ..."><br><br>
			
		<label style="display: block; margin-right: 115px;">Password:</label>
			<input type="password"name="password" placeholder="Enter password ..."><br><br>
				
		<label style="display: block;">Role:</label> 
		<select name="role">
			<option value="3">Employee</option>
		</select><br><br>
		
		<input type="submit" value="Register" style="padding: 5px 10px;">
</form>
</body>
</html>