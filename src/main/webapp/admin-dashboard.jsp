<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
}
%>
	<h2>Admin Dashboard</h2>

	<a href="create-exam.jsp">Create Exam</a>
	<br><br>
	
	<a href="add-question.jsp">Add Question</a>
	<br><br>
	
	<a href="view-all-results">View Results</a>
	<br><br>
	
	<a href="LogoutServlet">Logout</a>

</body>
</html>