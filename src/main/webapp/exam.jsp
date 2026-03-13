<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Question" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial, sans-serif;
}

body{
background:#f4f6f9;
padding:30px;
}

/* HEADER */

.header{
background:#2c3e50;
color:white;
padding:15px 25px;
margin-bottom:20px;
border-radius:6px;
display:flex;
justify-content:space-between;
align-items:center;
}

.timer{
background:#e74c3c;
padding:8px 15px;
border-radius:5px;
}

/* EXAM CONTAINER */

.exam-container{
max-width:800px;
margin:auto;
}

/* QUESTION CARD */

.question-card{
background:white;
padding:20px;
margin-bottom:20px;
border-radius:8px;
box-shadow:0 3px 8px rgba(0,0,0,0.1);
}

.question-card p{
margin-bottom:10px;
font-size:16px;
}

/* OPTIONS */

.option{
margin:6px 0;
}

/* SUBMIT BUTTON */

.submit-btn{
display:block;
margin:30px auto;
background:#27ae60;
color:white;
border:none;
padding:12px 30px;
font-size:16px;
border-radius:6px;
cursor:pointer;
}

.submit-btn:hover{
background:#1e8449;
}

</style>

</head>

<body>

<div class="header">
<h2>Online Examination</h2>
<div class="timer">Time Left: 30:00</div>
</div>

<div class="exam-container">

<%
List<Question> questions = (List<Question>) request.getAttribute("questionList");
%>

<form action="submit-exam" method="post">

<%
for(Question q : questions){
%>

<div class="question-card">

<p><b><%= q.getQuestionText() %></b></p>

<div class="option">
<input type="radio" name="q<%= q.getId() %>" value="1"> <%= q.getOption1() %>
</div>

<div class="option">
<input type="radio" name="q<%= q.getId() %>" value="2"> <%= q.getOption2() %>
</div>

<div class="option">
<input type="radio" name="q<%= q.getId() %>" value="3"> <%= q.getOption3() %>
</div>

<div class="option">
<input type="radio" name="q<%= q.getId() %>" value="4"> <%= q.getOption4() %>
</div>

</div>

<%
}
%>

<button class="submit-btn" type="submit">Submit Exam</button>

</form>

</div>

</body>
</html>