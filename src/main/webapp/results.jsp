<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Result" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Results</title>

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

/* MAIN AREA */

.container{
display:flex;
}

.main{
flex:1;
padding:40px;
}

/* TITLE */

.main h2{
margin-bottom:25px;
color:#333;
}

.stats-grid{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(180px,1fr));
gap:20px;
margin-bottom:30px;
}

.stat-card{
background:white;
padding:22px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.08);
text-align:center;
}

.stat-card h3{
margin-bottom:10px;
font-size:18px;
color:#333;
}

.stat-card p{
font-size:24px;
font-weight:700;
color:#2c3e50;
}

/* RESULT CARD */

.result-card{
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

/* BACK BUTTON */

.back-btn{
display:inline-block;
margin-top:25px;
text-decoration:none;
background:linear-gradient(135deg,#27ae60,#2ecc71);
color:white;
padding:10px 22px;
border-radius:6px;
font-size:14px;
transition:0.25s;
}

.back-btn:hover{
transform:translateY(-2px);
box-shadow:0 5px 12px rgba(0,0,0,0.15);
}

</style>

</head>

<body>

<!-- Header -->
<jsp:include page="components/header.jsp"/>

<div class="container">

<!-- Sidebar -->
<jsp:include page="components/sidebar.jsp"/>

<div class="main">

<%
List<Result> results = (List<Result>) request.getAttribute("resultList");
String pageTitle = request.getAttribute("pageTitle") != null ? (String) request.getAttribute("pageTitle") : "Your Results";
String backLink = request.getAttribute("backLink") != null ? (String) request.getAttribute("backLink") : "student-dashboard.jsp";
String backLabel = request.getAttribute("backLabel") != null ? (String) request.getAttribute("backLabel") : "Back to Dashboard";
String msg = request.getParameter("msg");
%>

<h2><%= pageTitle %></h2>

<%
if ("submitted".equals(msg)) {
%>
<div class="result-card" style="margin-bottom:20px; border-left:4px solid #22c55e;">
    Your exam was submitted successfully.
</div>
<%
} else if ("alreadyAttempted".equals(msg)) {
%>
<div class="result-card" style="margin-bottom:20px; border-left:4px solid #f59e0b;">
    This exam has already been submitted, so a duplicate result was not saved.
</div>
<%
}
%>

<%
int examCount = request.getAttribute("examCount") != null ? (Integer) request.getAttribute("examCount") : 0;
double averageScore = request.getAttribute("averageScore") != null ? (Double) request.getAttribute("averageScore") : 0.0;
String bestCategory = (String) request.getAttribute("bestCategory");
if(bestCategory == null || bestCategory.isEmpty()) {
    bestCategory = "N/A";
}
%>

<div class="stats-grid">
    <div class="stat-card">
        <h3>Total Exams Taken</h3>
        <p><%= examCount %></p>
    </div>
    <div class="stat-card">
        <h3>Average Score</h3>
        <p><%= String.format("%.2f", averageScore) %></p>
    </div>
    <div class="stat-card">
        <h3>Best Category</h3>
        <p><%= bestCategory %></p>
    </div>
</div>

<div class="result-card">

<table>

<tr>
<th>Exam</th>
<th>Score</th>
</tr>

<%
if(results == null || results.isEmpty()){
%>

<tr>
<td colspan="2">No results found</td>
</tr>

<%
}else{
for(Result r : results){
%>

<tr>
<td><%= r.getExamTitle() %></td>
<td><%= r.getScore() %></td>
</tr>

<%
}
}
%>

</table>

</div>

<a class="back-btn" href="<%= backLink %>"><%= backLabel %></a>

</div>

</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>

