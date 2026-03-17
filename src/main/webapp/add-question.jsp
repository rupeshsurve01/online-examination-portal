<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="create-question" method="post">
		<label>Question</label>
		<textarea rows="10" cols="10" name="question"></textarea>
		
		<label>Option1</label>
		<input type="text" name="option1">
		
		<label>Option2</label>
		<input type="text" name="Option2">
		
		<label>Option3</label>
		<input type="text" name="option3">
		
		<label>Option4</label>
		<input type="text" name="option4">
		
		<label>Correct Option</label>
		<input type="number" name="corect_option">
		
		<input type="submit" value="Submit">
	
	</form>

</body>
</html>