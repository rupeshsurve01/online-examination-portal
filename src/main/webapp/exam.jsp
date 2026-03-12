<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="model.Question" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
List<Question> questions = (List<Question>) request.getAttribute("questionList");
%>

<h2>Exam Questions</h2>

<form action="submit-exam" method="post">

<%
for(Question q : questions){
%>

<p><b><%= q.getQuestionText() %></b></p>

<input type="radio" name="q<%= q.getId() %>" value="1"> <%= q.getOption1() %><br>
<input type="radio" name="q<%= q.getId() %>" value="2"> <%= q.getOption2() %><br>
<input type="radio" name="q<%= q.getId() %>" value="3"> <%= q.getOption3() %><br>
<input type="radio" name="q<%= q.getId() %>" value="4"> <%= q.getOption4() %><br>

<br>

<%
}
%>

<button type="submit">Submit Exam</button>

</form>
</body>
</html>