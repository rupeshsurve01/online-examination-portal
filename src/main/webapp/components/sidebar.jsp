<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sidebar</title>

<style>

/* SIDEBAR */

.sidebar{
width:240px;
background:#1f2937;
color:white;
padding-top:30px;
height:100vh;
box-shadow:4px 0px 12px rgba(0,0,0,0.1);
}

.sidebar a{
display:block;
padding:14px 25px;
color:#d1d5db;
text-decoration:none;
font-size:15px;
transition:0.25s;
border-left:4px solid transparent;
}

.sidebar a:hover{
background:#111827;
color:white;
border-left:4px solid #6366f1;
padding-left:30px;
}

.sidebar a:first-child{
margin-top:10px;
}

</style>

</head>

<body>

<div class="sidebar">

<a href="student-dashboard.jsp">🏠 Dashboard</a>

<a href="view-exams">📝 Available Exams</a>

<a href="results.jsp">📊 My Results</a>

</div>

</body>
</html>