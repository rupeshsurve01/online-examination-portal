<%@ page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");
String dashboardLink = "student-dashboard.jsp";

if (user != null && "admin".equalsIgnoreCase(user.getRole())) {
    dashboardLink = "admin-dashboard.jsp";
}
%>

<style>
.sidebar{
width:240px;
background:#1f2937;
color:white;
padding-top:30px;
height:100vh;
box-shadow:4px 0 12px rgba(0,0,0,0.1);
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

<div class="sidebar">
    <a href="<%= dashboardLink %>">Dashboard</a>
    <a href="view-exams">Available Exams</a>
    <a href="view-results">My Results</a>
</div>
