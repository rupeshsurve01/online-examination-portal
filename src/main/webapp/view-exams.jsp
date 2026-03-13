<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Exam" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Exams</title>

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

.main h2{
margin-bottom:20px;
color:#333;
}

/* TABLE */

table{
width:100%;
border-collapse:collapse;
background:white;
box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

th{
background:#3498db;
color:white;
padding:12px;
}

td{
padding:12px;
text-align:center;
border-bottom:1px solid #ddd;
}

tr:hover{
background:#f1f1f1;
}

/* BUTTON */

.start-btn{
text-decoration:none;
background:#27ae60;
color:white;
padding:6px 12px;
border-radius:5px;
}

.start-btn:hover{
background:#1e8449;
}

</style>

</head>

<body>

<jsp:include page="components/header.jsp"/>

<div class="container">

<jsp:include page="components/sidebar.jsp"/>

<div class="main">

<%
List<Exam> exams = (List<Exam>) request.getAttribute("examList");
%>

<h2>Available Exams</h2>

<table>

<tr>
<th>Exam ID</th>
<th>Title</th>
<th>Duration</th>
<th>Action</th>
</tr>

<%
if(exams != null){
for(Exam exam : exams){
%>

<tr>
<td><%= exam.getId() %></td>
<td><%= exam.getTitle() %></td>
<td><%= exam.getDuration() %> minutes</td>
<td>
<a class="start-btn" href="start-exam?examId=<%= exam.getId() %>">Start Exam</a>
</td>
</tr>

<%
}
}
%>

</table>

</div>

</div>

</body>
</html>