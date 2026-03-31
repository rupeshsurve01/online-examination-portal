<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");

if(user == null || !"admin".equalsIgnoreCase(user.getRole())){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body{
background:#f4f6fb;
}

/* LAYOUT */

.container{
display:flex;
}

/* MAIN CONTENT */

.main{
flex:1;
padding:40px;
}

/* PAGE TITLE */

.main h2{
margin-bottom:25px;
color:#333;
}

/* DASHBOARD CARDS */

.dashboard{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
gap:20px;
}

.card{
background:white;
padding:25px;
border-radius:10px;
box-shadow:0 6px 15px rgba(0,0,0,0.08);
transition:0.3s;
text-align:center;
}

.card:hover{
transform:translateY(-5px);
box-shadow:0 12px 25px rgba(0,0,0,0.15);
}

.card a{
text-decoration:none;
color:#333;
font-size:16px;
font-weight:600;
display:block;
}

.card span{
display:block;
font-size:30px;
margin-bottom:10px;
}

</style>

</head>

<body>

<!-- HEADER -->
<jsp:include page="components/header.jsp"/>

<div class="container">

<!-- SIDEBAR -->
<jsp:include page="components/sidebar.jsp"/>

<div class="main">

<h2>Admin Dashboard</h2>

<div class="dashboard">

<div class="card">
<span>📝</span>
<a href="create-exam.jsp">Create Exam</a>
</div>

<div class="card">
<span>📝</span>
<a href="view-exams">Check Exams</a>
</div>


<div class="card">
<span>📊</span>
<a href="view-results">View Results</a>
</div>

<div class="card">
<span>🚪</span>
<a href="LogoutServlet">Logout</a>
</div>

</div>

</div>

</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>

