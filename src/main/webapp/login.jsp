<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(135deg,#667eea,#764ba2);
}

/* LOGIN CONTAINER */

.main-login{
width:100%;
display:flex;
justify-content:center;
align-items:center;
}

/* LOGIN CARD */

.main{
width:450px;
height:400px;
height:auto;
background:rgba(255,255,255,0.95);
padding:35px;
border-radius:12px;
box-shadow:0 15px 40px rgba(0,0,0,0.2);
text-align:center;
}

/* TITLE */

.main h2{
margin-bottom:25px;
color:#333;
}

/* INPUTS */

.input{
width:100%;
padding:12px;
margin-bottom:15px;
border:1px solid #ddd;
border-radius:6px;
font-size:14px;
transition:0.25s;
}

.input:focus{
border-color:#667eea;
box-shadow:0 0 5px rgba(102,126,234,0.4);
outline:none;
}

/* BUTTON */

button{
width:100%;
padding:12px;
border:none;
border-radius:6px;
background:linear-gradient(135deg,#667eea,#764ba2);
color:white;
font-size:15px;
cursor:pointer;
transition:0.3s;
}

button:hover{
transform:translateY(-2px);
box-shadow:0 5px 12px rgba(0,0,0,0.2);
}

/* LINK */

a{
display:block;
margin-top:15px;
text-decoration:none;
color:#667eea;
font-size:14px;
}

a:hover{
text-decoration:underline;
}

</style>

</head>

<body>

<div class="main-login">

<div class="main">

<h2>User Login</h2>

<form action="LoginServlet" method="post">

<input type="email" name="email" placeholder="Email" class="input" required>

<input type="password" name="password" placeholder="Password" class="input" required>

<button type="submit">Login</button>

<a href="register.jsp">Don't have an account? Sign Up</a>

</form>

</div>

</div>

</body>
</html>