<%@page import="com.bean.Userbeans"%>
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
<h2 style="text-align: center">Manager Panel</h2><hr><br>
<%
Userbeans bean = (Userbeans) session.getAttribute("obj");
int id = bean.getId();
//System.out.print(id);
ResultSet rs = null;
PreparedStatement ps = null;
Connection c = null;
int count = 0;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    c = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheet", "root", "55555");
    ps = c.prepareStatement("select * from company where role=? and superemp=?");
    ps.setInt(1, 3);
    ps.setInt(2, id);
    rs=ps.executeQuery();
%>
    <table border="1" cellpadding="5" align="center">
        <tr>
            <th>Name</th>
            <th>Mobile no</th>
            <th>Password</th>
            <th>Role</th>
            <th>All Task</th>
            <th>Assign Task</th>
        </tr>
        <%
        while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= "Employee" %></td>
            <td><a href="alltask.jsp?empid=<%=rs.getInt(1)%>">All Task</a></td>
            <td><a href="assigntask.jsp?empid=<%=rs.getInt(1)%>">Assign Task</a></td>
        </tr>
        <%
        }
        %>
    </table><br>
    <%
	} catch (Exception e) {
   		 System.out.print(e);
	} 

	try {
   		 c = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheet", "root", "55555");
   		 PreparedStatement ps1 = c.prepareStatement("select count(*) from company where superemp=?");
   		 ps1.setInt(1, id);
   		 ResultSet rs1 = ps1.executeQuery();
   		 
   	 if (rs1.next()) {
        count = rs1.getInt(1);
    }

	} catch (Exception e) {
   		 System.out.println(e);
	}
	%>
	<div style="text-align: center;">
		<a href="index.jsp">LOGOUT</a>
	</div><br>
	<%
		if (count<3) {
	%>
	<div style="text-align: center;">
     	<a href="addemp.jsp">ADD EMPLOYEES</a>
    </div><br>
	<%
	} else {
	%>
   	  <h3 style="color: red; text-align: center;">Limit reached, you have already added 3 employees !!</h3>
	<%
	}
 	%>
</body>
</html>