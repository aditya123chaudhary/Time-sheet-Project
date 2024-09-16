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
	try {
		boolean flag = false;
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/timesheet", "root", "55555");
		PreparedStatement ps = c.prepareStatement("Select * from company where mobileno=? and password=? ");
		ps.setString(1, request.getParameter("mobileno"));
		ps.setString(2, request.getParameter("password"));
		ResultSet rs = ps.executeQuery();
		Userbeans userbean = null;
		if (rs.next()) {
			flag = true;
			userbean= new Userbeans();
			//System.out.print(rs.getInt(1));
			userbean.setId(rs.getInt(1));
			userbean.setName(rs.getString(2));
			userbean.setMobileno(rs.getString(3));
			userbean.setPassword(rs.getString(4));
			userbean.setRole(rs.getString(5));
		}
	    if (flag) {
	        pageContext.setAttribute("obj", userbean, pageContext.SESSION_SCOPE);
	        String role = userbean.getRole();
	        
	        if (role.equals("1")) 
	        {
	            response.sendRedirect("admin.jsp");
	        } 
	        else if (role.equals("2"))
	        {
	            response.sendRedirect("manager.jsp");
	        } 
	        else if (role.equals("3"))
	        {
	            response.sendRedirect("task.jsp");
	        }
	        else
	        {
	            response.sendRedirect("index.jsp");
	        }
	    } 
	    else {
	        pageContext.setAttribute("Valid", "true", pageContext.SESSION_SCOPE);
	        response.sendRedirect("index.jsp");
	    }
	} catch (Exception e) {
	    System.out.print(e);
	}
	%>
</body>
</html>