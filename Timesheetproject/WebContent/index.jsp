<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="checklogin.jsp" method="post" style="text-align: center;">
    <h1>Login</h1><hr><br><br>

    <label style="display: block; margin-bottom: 5px; margin-right: 120px;">Mobile no:</label>
    <input type="text" name="mobileno" placeholder="Enter mobileno Here..." style=" padding: 5px;"><br><br>

    <label style="display: block; margin-bottom: 5px; margin-right: 120px;">Password:</label>
    <input type="password" name="password" placeholder="Enter password Here..." style="padding: 5px;"><br><br>

    <input type="submit" value="Login" style="padding: 5px 10px;">

    <% 
        String v = (String) session.getAttribute("Valid");
        if (v != null && v.equals("true")) {
    %>
    <h2 style="color: red; text-align: center;">Invalid User !!</h2>
    <%
      }
    %>
</form>
</body>
</html>