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
  int empid = Integer.parseInt(request.getParameter("empid"));
  System.out.print(empid);
  session.setAttribute("empid", empid);
  %>

<form action="savetask.jsp" method="post" style="text-align: center;">
	<h2 style="text-align: center;">Assign Task To Employee</h2><hr><br><br>

	<label style="display: block; margin-right: 90px;">Project Name:</label>
	<input type="text" name="projectname" placeholder="Enter project name ..."><br><br>
	
	<label style="display: block; margin-right: 150px;">Task:</label>
	<input type="text" name="tasks" placeholder="Enter task ..."><br><br>
	
	<div style="text-align: center;">
	  <a href="manager.jsp">Go Back</a>
	</div><br>
    <input type="submit" value="Assign Task" style="padding: 5px 10px;">
</form>
</body>
</html>