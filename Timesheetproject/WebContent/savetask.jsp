<%@page import="com.bean.Userbeans"%>
<%@page import="com.bean.Empbean"%>
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
	int empid=(int)session.getAttribute("empid");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheet", "root", "55555");
    PreparedStatement ps = c.prepareStatement("insert into task (projectname, tasks,empid) values (?,?,?)");
    ps.setString(1, request.getParameter("projectname"));
    ps.setString(2, request.getParameter("tasks"));
    ps.setInt(3, empid);
    int i = ps.executeUpdate();
    if (i != 0) {
        response.sendRedirect("manager.jsp");
    } else {
        response.sendRedirect("./");
    }
} catch (Exception e) {
    System.out.println(e);
}
%>
</body>
</html>