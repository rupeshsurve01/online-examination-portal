<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp page="components/header.jsp"/>

<jsp page="components/sidebar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	/* HEADER */
	
	*{
		margin: 0px;
		padding: 0px;
	}

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
	
</style>
<body>

<jsp:include page="components/header.jsp"/>

<div class="container">

<jsp:include page="components/sidebar.jsp"/>

<div class="main">
	

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
}
%>
	<h2>Admin Dashboard</h2>

	<a href="create-exam.jsp">Create Exam</a>
	<br><br>
	
	<a href="add-question.jsp">Add Question</a>
	<br><br>
	
	<a href="view-all-results">View Results</a>
	<br><br>
	
	<a href="LogoutServlet">Logout</a>
	
		</div>

</div>
	

</body>
</html>