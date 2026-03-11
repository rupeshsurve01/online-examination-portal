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

	<h2>User Login</h2>

	<form action="LoginServlet" method="post">


<input type="email" name="email" placeholder="Email" class="input" required>


<input type="password" name="password" placeholder="Password" class="input" required>

<button type="submit">Login</button>
	<a href="register.jsp">Don't have Account? Sign In</a>

</form>
</div>
</div>
</body>
</html>