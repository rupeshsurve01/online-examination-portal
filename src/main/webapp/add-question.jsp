<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Question</title>

<style>

body{
    font-family: Arial, Helvetica, sans-serif;
    background: linear-gradient(120deg,#667eea,#764ba2);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    margin:0;
}

.container{
    background:white;
    padding:35px;
    width:420px;
    border-radius:10px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:#333;
}

label{
    font-weight:bold;
    display:block;
    margin-top:12px;
    margin-bottom:5px;
}

input[type="text"],
input[type="number"],
textarea{
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:5px;
    outline:none;
    font-size:14px;
}

textarea{
    resize:none;
}

input:focus,
textarea:focus{
    border-color:#667eea;
}

button{
    width:100%;
    margin-top:20px;
    padding:12px;
    border:none;
    border-radius:6px;
    background:#667eea;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#5563d1;
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
<textarea rows="4" name="question" placeholder="Enter question"></textarea>

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

<button type="submit">Submit Question</button>

</form>

</div>

</body>
</html>