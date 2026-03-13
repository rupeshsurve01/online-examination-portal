<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User" %>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>

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

.header h2{
font-size:22px;
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
}

.welcome{
margin-bottom:30px;
font-size:22px;
color:#333;
}

/* DASHBOARD CARDS */

.cards{
display:flex;
gap:20px;
}

.card{
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 4px 10px rgba(0,0,0,0.1);
flex:1;
text-align:center;
}

.card h3{
margin-bottom:15px;
}

.card a{
text-decoration:none;
background:#3498db;
color:white;
padding:10px 20px;
border-radius:5px;
display:inline-block;
}

.card a:hover{
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
<a href="#">Dashboard</a>
<a href="view-exams">Available Exams</a>
<a href="results.jsp">My Results</a>
</div>

<div class="main">

<div class="welcome">
Welcome, <strong><%= user.getName() %></strong>
</div>

<div class="cards">

<div class="card">
<h3>Available Exams</h3>
<p>Start your scheduled exams.</p>
<br>
<a href="view-exams">View Exams</a>
</div>

<div class="card">
<h3>Results</h3>
<p>Check your exam results.</p>
<br>
<a href="results.jsp">View Results</a>
</div>

</div>

</div>

</div>

</body>
</html>