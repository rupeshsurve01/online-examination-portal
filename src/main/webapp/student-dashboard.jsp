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
font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* HEADER */

.header{
background:linear-gradient(135deg,#667eea,#764ba2);
color:white;
padding:16px 30px;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

.header h2{
font-size:22px;
font-weight:600;
}

.header a{
color:white;
text-decoration:none;
background:#ff4b5c;
padding:8px 18px;
border-radius:20px;
font-size:14px;
transition:0.3s;
}

.header a:hover{
background:#ff2e44;
}

/* LAYOUT */

.container{
display:flex;
height:calc(100vh - 65px);
}

/* SIDEBAR */

.sidebar{
width:230px;
background:#1f2937;
padding-top:25px;
}

.sidebar a{
display:block;
padding:14px 22px;
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
padding-left:28px;
}

/* MAIN CONTENT */

.main{
flex:1;
padding:40px;
background:#f4f6fb;
}

/* WELCOME */

.welcome{
margin-bottom:35px;
font-size:24px;
font-weight:600;
color:#2c3e50;
}

/* DASHBOARD CARDS */

.cards{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(240px,1fr));
gap:25px;
}

.card{
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.08);
transition:0.3s;
text-align:center;
}

.card:hover{
transform:translateY(-5px);
box-shadow:0 15px 35px rgba(0,0,0,0.15);
}

.card h3{
margin-bottom:12px;
color:#333;
}

.card p{
color:#666;
margin-bottom:20px;
font-size:14px;
}

.card a{
text-decoration:none;
background:linear-gradient(135deg,#667eea,#764ba2);
color:white;
padding:10px 22px;
border-radius:6px;
font-size:14px;
display:inline-block;
transition:0.3s;
}

.card a:hover{
opacity:0.9;
}

</style>

</head>

<body>

<jsp:include page="components/header.jsp"/>

<div class="container">

<jsp:include page="components/sidebar.jsp"/>

<div class="main">

<div class="welcome">
Welcome, <strong><%= user.getName() %></strong> 👋
</div>

<div class="cards">

<div class="card">
<h3>📝 Available Exams</h3>
<p>Start your scheduled exams.</p>
<a href="view-exams">View Exams</a>
</div>

<div class="card">
<h3>📊 Results</h3>
<p>Check your exam results.</p>
<a href="view-results">View Results</a>
</div>

</div>

</div>

</div>

</body>
</html>