<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
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

button a{
	text-decoration: none;
	color: white;
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
User user = (User) session.getAttribute("user");

if(user == null || !"admin".equalsIgnoreCase(user.getRole())){
    response.sendRedirect("login.jsp");
    return;
}

String examParam = request.getParameter("examId");
int examId = 0;

if(examParam != null){
    try {
        examId = Integer.parseInt(examParam);
    } catch (NumberFormatException e) {
        examId = 0;
    }
}

if(examId > 0){
    response.sendRedirect("edit-exam?examId=" + examId);
    return;
}

response.sendRedirect("view-exams");
return;
%>

</body>
</html>

