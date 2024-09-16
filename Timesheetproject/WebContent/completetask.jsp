<%@page import="com.bean.Userbeans"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
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
//System.out.print(bean.getId());
%>
<h1 style="text-align: center;">Completed Tasks</h1><hr><br>

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
</tr>
    <%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheet", "root", "55555");
    PreparedStatement sta = con.prepareStatement("select * from task where empid=? and time is not null and date is not null");
    System.out.print(bean.getId() + "");
    sta.setInt(1, bean.getId());
    ResultSet rs = sta.executeQuery();

    if (!rs.next()) {
%>
        <h2 style="text-align: center;color: red">Task not completed</h2>
    
<%
    } else {
        do {
%>
    <tr>
        <td><%=rs.getInt(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><%=rs.getString(4) %></td>
        <td><%=rs.getString(5) %></td>
        <td><%=rs.getString(6) %></td>
        <td><%=rs.getString(7) %></td>
        <td><%=rs.getString(8) %></td>
        <td><%=rs.getString(9) %></td>
    </tr>
<%
        } while (rs.next());
    }
} catch (Exception e) {
    System.out.print(e);
}
%>

</table><br> 
<div style="text-align: center;">
 <a href="task.jsp" >Go Back</a>
</div>
</body>
</html>