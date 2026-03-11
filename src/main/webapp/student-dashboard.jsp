<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="model.User" %>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>
</head>

<body>

<h2>Welcome <%= user.getName() %></h2>

<h3>Student Dashboard</h3>

<a href="view-exams">View Available Exams</a><br><br>

<a href="results.jsp">View Results</a><br><br>

<a href="login.jsp">Logout</a>

</body>
</html>