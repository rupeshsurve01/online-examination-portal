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

/* MAIN */

.main{
flex:1;
padding:40px;
background:#f4f6fb;
}

.main h2{
margin-bottom:25px;
color:#333;
}

/* TABLE CONTAINER */

.table-card{
background:white;
padding:25px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.08);
}

/* TABLE */

table{
width:100%;
border-collapse:collapse;
}

th{
background:linear-gradient(135deg,#667eea,#764ba2);
color:white;
padding:14px;
font-weight:500;
}

td{
padding:14px;
text-align:center;
border-bottom:1px solid #eee;
}

tr:hover{
background:#f9fafc;
}

/* BUTTON */

.start-btn{
text-decoration:none;
background:linear-gradient(135deg,#27ae60,#2ecc71);
color:white;
padding:7px 16px;
border-radius:6px;
font-size:14px;
transition:0.25s;
}

.start-btn:hover{
transform:translateY(-2px);
box-shadow:0 4px 10px rgba(0,0,0,0.15);
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

<div class="table-card">

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
<a class="start-btn" href="start-exam?examId=<%= exam.getId() %>">
Start Exam
</a>
</td>
</tr>

<%
}
}
%>

</table>

</div>

</div>

</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>

