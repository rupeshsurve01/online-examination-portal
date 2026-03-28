<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* BACKGROUND */

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(135deg,#667eea,#764ba2);
}

/* CONTAINER */

.main-login{
width:100%;
display:flex;
justify-content:center;
align-items:center;
}

/* CARD */

.main{
width:450px;
height: 400px;
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

/* INPUT */

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
box-shadow:0 6px 15px rgba(0,0,0,0.2);
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

<h2>User Registration</h2>

<form action="RegisterServlet" method="post">

<input type="text" name="name" required placeholder="Name" class="input">

<input type="email" name="email" required placeholder="Email" class="input">

<input type="password" name="password" required placeholder="Password" class="input">

<input type="hidden" name="role" value="student">

<button type="submit">Register</button>

</form>

<a href="login.jsp">Already have an account? Login</a>

</div>

</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>

