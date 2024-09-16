<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="saveadmin.jsp" method="post" style="text-align: center;">
<h1>Manager Page</h1><hr><br><br>

		<label style="display: block; margin-right: 135px;">Name:</label>
			<input type="text" name="name" placeholder="Enter name ..."><br><br>
			
		<label style="display: block; margin-right: 115px;">Mobile no:</label>
			<input type="text"name="mobileno" placeholder="Enter moblienumber ..."><br><br>
			
		<label style="display: block; margin-right: 115px;">Password:</label>
			<input type="password"name="password" placeholder="Enter password ..."><br><br>	
			
		<label style="display: block;">Role:</label> 
		<select name="role">
			<option value="2">Manager</option>
		</select><br><br>
		
		<input type="submit" value="Add manager" style="padding: 5px 10px;">
</form>
</body>
</html>