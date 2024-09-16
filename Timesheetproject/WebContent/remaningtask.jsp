<%@page import="com.bean.Userbeans"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
%>
<h1 style="text-align: center;">Remaining Tasks</h1><hr><br>

<table border="1" cellpadding="5" align="center">
<tr>
      <th> Task ID </th>
      <th> Project Name </th>
      <th> Description </th>
      <th> Task </th>
      <th> Date </th>
      <th> Remarks </th>
      <th> Rating </th>
      <th> Errors </th>
      <th> Time </th> 
      <th> Submit </th>
</tr>
          
    <%
        try{ 
          Class.forName("com.mysql.jdbc.Driver");
       	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheet","root","55555");
       	  PreparedStatement ps= con.prepareStatement("select * from task where empid=? and time is null and date is null");
       	  ps.setInt(1, bean.getId());
       	  ResultSet rs = ps.executeQuery();
       	  
       		if (rs.next()) {
           	 do {
       		  %>
       		  <form action="saveremaningtask.jsp">
       		  <tr>
       		  	    <input type="hidden" value="<%=rs.getInt(1) %>" name="hide">
       		  	    
       		  		<td><%=rs.getString(1) %></td>
       		  		
    				<td><%= rs.getString(2) %></td>
    				
    				<%
    				 if(rs.getString(3)==null){
    				%>
    				<td><input type="text" name="description" value=" "></td>
    				<%
    				 } else{
    				%>
    				<td><input type="text" name="description" value="<%=rs.getString(3)%>"></td>
    				<%} %>
    				
    				<td><%=rs.getString(4) %></td>
    				
    				<%
    				 if(rs.getString(5)==null){
    				%>
    				<td><input type="date" name="date" value=" "></td>
    				<%
    				 } else{
    				%>
    				<td><input type="date" name="date" value="<%=rs.getString(5)%>"></td>
    				<%} %>
    				
    				<%
    				 if(rs.getString(6)==null){
    				%>
    				<td><input type="text" name="remark" value=" "></td>
    				<%
    				 } else{
    				%>
    				<td><input type="text" name="remark" value="<%=rs.getString(6)%>"></td>
    				<%} %>
    				
    				<td><%=rs.getString(7) %></td>
    				
    				<%
    				 if(rs.getString(8)==null){
    				%>
    				<td><input type="text" name="error" value=" "></td>
    				<%
    				 } else{
    				%>
    				<td><input type="text" name="error" value="<%=rs.getString(8)%>"></td>
    				<%} %>
    				
    				<%
    				 if(rs.getString(9)==null){
    				%>
    				<td><input type="text" name="time" value=" "></td>
    				<%
    				 } else{
    				%>
    				<td><input type="text" name="time" value="<%=rs.getString(9)%>"></td>
    				<%} %>
    				
    				<td><input type="submit" value="Update" style="padding: 5px 10px;"></td>
    			 </form>  
    			 
    			<%	
        	 } while (rs.next());
         } else {
             %>
        		<h2 style="text-align: center;color: red">No task is remaining </h2>
             <%
         }
        	%>
        	</table><br>
        	<div style="text-align: center;">
 				<a href="task.jsp" >Go Back</a>
			</div>
       		  <%
        } catch(Exception e){
        	System.out.println(e);
        }
     %>
</body>
</html>