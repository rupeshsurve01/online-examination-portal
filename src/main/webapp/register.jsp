<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>User Registration</h2>

<form action="RegisterServlet" method="post">

Name:
<input type="text" name="name" required><br><br>

Email:
<input type="email" name="email" required><br><br>

Password:
<input type="password" name="password" required><br><br>

<input type="hidden" name="role" value="student">

<button type="submit">Register</button>

</form>

<a href="login.jsp">Already have account? Login</a>
</body>
</html>