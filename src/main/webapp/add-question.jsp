<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Question</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* PAGE BACKGROUND */

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(135deg,#667eea,#764ba2);
}

/* CARD */

.container{
width:440px;
background:rgba(255,255,255,0.95);
padding:35px;
border-radius:14px;
box-shadow:0 15px 40px rgba(0,0,0,0.2);
backdrop-filter:blur(10px);
animation:fadeIn 0.6s ease;
}

/* TITLE */

h2{
text-align:center;
margin-bottom:25px;
color:#2c3e50;
font-weight:600;
letter-spacing:0.5px;
}

/* LABELS */

label{
display:block;
font-weight:600;
margin-top:14px;
margin-bottom:6px;
color:#444;
}

/* INPUTS */

input[type="text"],
input[type="number"],
textarea{
width:100%;
padding:11px;
border:1px solid #dcdcdc;
border-radius:6px;
font-size:14px;
transition:all 0.25s ease;
}

textarea{
resize:none;
}

/* INPUT FOCUS */

input:focus,
textarea:focus{
border-color:#667eea;
box-shadow:0 0 5px rgba(102,126,234,0.4);
outline:none;
}

/* BUTTON */

button{
width:100%;
margin-top:22px;
padding:13px;
border:none;
border-radius:7px;
background:linear-gradient(135deg,#667eea,#764ba2);
color:white;
font-size:16px;
font-weight:600;
cursor:pointer;
transition:all 0.3s ease;
}

button:hover{
transform:translateY(-2px);
box-shadow:0 6px 15px rgba(0,0,0,0.15);
}

/* ANIMATION */

@keyframes fadeIn{
from{
opacity:0;
transform:translateY(20px);
}
to{
opacity:1;
transform:translateY(0);
}
}

</style>

</head>

<body>

<%
String examParam = request.getParameter("examId");
int examId = 0;

if(examParam != null){
    examId = Integer.parseInt(examParam);
}
%>

<div class="container">

<h2>Add Question</h2>

<form action="create-question" method="post">

<input type="hidden" name="exam_id" value="<%= examId %>">

<label>Question</label>
<textarea rows="4" name="question" placeholder="Enter your question"></textarea>

<label>Option 1</label>
<input type="text" name="option1" placeholder="Option 1">

<label>Option 2</label>
<input type="text" name="option2" placeholder="Option 2">

<label>Option 3</label>
<input type="text" name="option3" placeholder="Option 3">

<label>Option 4</label>
<input type="text" name="option4" placeholder="Option 4">

<label>Correct Option (1-4)</label>
<input type="number" name="correct_option" min="1" max="4">

<button type="submit">Add Question</button>

</form>

</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>

