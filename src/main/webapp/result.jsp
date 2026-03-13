<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam Result</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial, sans-serif;
}

/* HEADER */

.header{
background:#2c3e50;
color:white;
padding:15px 30px;
display:flex;
justify-content:space-between;
align-items:center;
}

.header a{
color:white;
text-decoration:none;
background:#e74c3c;
padding:8px 15px;
border-radius:5px;
}

/* LAYOUT */

.container{
display:flex;
height:calc(100vh - 60px);
}

/* SIDEBAR */

.sidebar{
width:220px;
background:#34495e;
color:white;
padding-top:20px;
}

.sidebar a{
display:block;
padding:15px 20px;
color:white;
text-decoration:none;
transition:0.3s;
}

.sidebar a:hover{
background:#2c3e50;
}

/* MAIN CONTENT */

.main{
flex:1;
padding:40px;
background:#f4f6f9;
display:flex;
justify-content:center;
align-items:center;
}

/* RESULT CARD */

.result-card{
background:white;
padding:40px;
border-radius:10px;
text-align:center;
box-shadow:0 4px 10px rgba(0,0,0,0.1);
width:350px;
}

.result-card h2{
margin-bottom:20px;
}

.score{
font-size:40px;
color:#27ae60;
margin-bottom:20px;
}

.btn{
text-decoration:none;
background:#3498db;
color:white;
padding:10px 20px;
border-radius:5px;
}

.btn:hover{
background:#2980b9;
}

</style>

</head>

<body>

<div class="header">
<h2>Online Examination Portal</h2>
<a href="login.jsp">Logout</a>
</div>

<div class="container">

<div class="sidebar">
<a href="student-dashboard.jsp">Dashboard</a>
<a href="view-exams">Available Exams</a>
<a href="result.jsp">My Results</a>
</div>

<div class="main">

<%
int score = (Integer) request.getAttribute("score");
%>

<div class="result-card">

<h2>Exam Result</h2>

<div class="score"><%= score %></div>

<a class="btn" href="student-dashboard.jsp">Back to Dashboard</a>

</div>

</div>

</div>

</body>
</html>