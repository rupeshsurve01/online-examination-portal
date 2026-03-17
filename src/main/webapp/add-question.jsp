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
int examId = Integer.parseInt(request.getParameter("examId"));
%>

	<form action="create-question" method="post">

		<input type="hidden" name="exam_id" value="<%= examId %>">
		
		<label>Question</label>
		<textarea rows="5" cols="40" name="question"></textarea>
		
		<label>Option1</label>
		<input type="text" name="option1">
		
		<label>Option2</label>
		<input type="text" name="option2">
		
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