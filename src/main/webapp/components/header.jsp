<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Examination Portal</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* HEADER */

.header{
background: linear-gradient(135deg,#667eea,#764ba2);
color:white;
padding:15px 30px;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

.header h2{
font-size:22px;
font-weight:600;
letter-spacing:0.5px;
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
transform:scale(1.05);
}

/* MAIN LAYOUT */

.container{
display:flex;
height:calc(100vh - 65px);
background:#f4f6fb;
}

</style>

</head>

<body>

<div class="header">
<h2>Online Examination Portal</h2>
<a href="login.jsp">Logout</a>
</div>

</body>
</html>