<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>Create Exam</h2>
	
	<form action="create-exam" method="post">
	
	Title:
	<input type="text" name="title">
	
	<br><br>
	
	Duration:
	<input type="number" name="duration">
	
	<br><br>
	
	<button type="submit">Create Exam</button>
	
	</form>

</body>
</html>