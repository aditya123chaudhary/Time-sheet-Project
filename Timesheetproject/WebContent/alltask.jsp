<%@page import="com.bean.Userbeans"%>
<%@page import="com.bean.Empbean"%>
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
<%
	Userbeans bean = (Userbeans) session.getAttribute("obj");
	int empid = Integer.parseInt(request.getParameter("empid"));
	System.out.print(empid);
	session.setAttribute("empid", empid);
%>

<h1 style="text-align: center;">Work Rating</h1><hr><br><br>

<table border="1" cellpadding="5" align="center">
<tr>
<th>Task id</th>
<th>Project name</th>
<th>Descriptions</th>
<th>Task</th>
<th>Date</th>
<th>Remark</th>
<th>Rating</th>
<th>Error</th>
<th>Time</th>
<th>Submission</th>
</tr>

<form action="saverating.jsp" method="post">
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheet", "root", "55555");
	PreparedStatement ps = c.prepareStatement("select * from task where empid=?");
	ps.setInt(1, empid);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		%>
		<tr>
		<input type="hidden" name="hide" value="<%=rs.getInt(1)%>">
		<td><%=rs.getInt(1) %></td>
		
		<td><%=rs.getString(2) %></td>
		
		<td ><%=rs.getString(3) != null ? rs.getString(3) :"<span style=\"color: red;\">Task not completed</span>"%></td>
		
		<td><%=rs.getString(4)%></td>
		
		<%if(rs.getString(5)==null){%>
		<td> </td>
		<%}else{%>
		<td><%=rs.getString(5)%></td>
		<%} %>
		
		<%if(rs.getString(6)==null){%>
		<td> </td>
		<%}else{%>
		<td><%=rs.getString(6)%></td>
		<%} %>
		
		<td>
        <% if (rs.getString(3) != null && rs.getInt(7) == 0) { %>
            <input type="text" name="rating" placeholder="Give rating...">
        <% } else if (rs.getString(3) != null && rs.getInt(7) != 0) { %>
            <%= rs.getInt(7) %>
        <% } else { %>
        <% } %>
        </td>
          
		<%if(rs.getString(8)==null){%>
		<td></td>
		<%}else{%>
		<td><%=rs.getString(8)%></td>
		<%} %>
		
		<%if(rs.getString(9)==null){%>
		<td> </td>
		<%}else{%>
		<td><%=rs.getString(9)%></td>
		<%} %>
		
		<td>
    	<% if (rs.getString(7) != null) { %>
    	<input type="submit" value="Update" disabled="disabled" style="padding: 5px 10px;">	
        
    	<% } else {%>
    	<input type="submit" value="Update" style="padding: 5px 10px;">
    	<%}%>
		</td>
		</tr>
		<%
		}
		%>
		</form>
       	</table><br>
       	
        <div style="text-align: center;">
	 	 <a href="manager.jsp">Go Back</a>
		</div>
	<%}
		catch(Exception e){
			e.printStackTrace();
    }%>

</body>
</html>