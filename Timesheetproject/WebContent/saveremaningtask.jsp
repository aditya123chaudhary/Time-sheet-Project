<%@page import="com.bean.Userbeans"%>
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
	try {
		int taskid=Integer.parseInt(request.getParameter("hide"));
   		Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheet", "root", "55555");
        PreparedStatement ps = c.prepareStatement("update task set description=?,date=?,remarks=?,rating=?,errors=?,time=? where taskid=?");
        ps.setString(1, request.getParameter("description"));
        ps.setString(2, request.getParameter("date"));
        ps.setString(3, request.getParameter("remark"));
        ps.setString(4, request.getParameter("rating"));
        ps.setString(5, request.getParameter("error"));
        ps.setString(6, request.getParameter("time"));
        ps.setInt(7, taskid);
      	int i = ps.executeUpdate();
   		 if (i != 0) {
        	response.sendRedirect("task.jsp");
   		 } else {
     	   response.sendRedirect("./");
  	  }
	} catch (Exception e) {
    System.out.println(e);
}
	%>
</body>
</html>