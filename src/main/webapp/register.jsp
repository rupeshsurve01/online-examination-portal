<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="main-login">
	<div class="main">

	<h2>User Registration</h2>

<form action="RegisterServlet" method="post">

<input type="text" name="name" required placeholder="Name" class="input">

<input type="email" name="email" required placeholder="Email" class="input">

<input type="password" name="password" placeholder="Password" required class="input">

<input type="hidden" name="role" value="student" class="input">

<button type="submit">Register</button>

</form>

	<a href="login.jsp">Already have account? Login</a>
	</div>
</div>

</body>
</html>