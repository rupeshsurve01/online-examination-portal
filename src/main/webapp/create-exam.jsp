<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Exam</title>

<style>

body{
    font-family: Arial, Helvetica, sans-serif;
    background: linear-gradient(120deg,#4facfe,#00f2fe);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    margin:0;
}

.container{
    background:white;
    padding:35px;
    width:350px;
    border-radius:10px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    margin-bottom:25px;
}

label{
    font-weight:bold;
    display:block;
    margin-bottom:5px;
}

input{
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:5px;
    margin-bottom:15px;
}

button{
    width:100%;
    padding:12px;
    border:none;
    border-radius:6px;
    background:#4facfe;
    color:white;
    font-size:16px;
    cursor:pointer;
}

button:hover{
    background:#3399ff;
}

</style>

</head>
<body>

<div class="container">

<h2>Create Exam</h2>

<form action="create-exam" method="post">

<label>Title</label>
<input type="text" name="title" required>

<label>Duration (minutes)</label>
<input type="number" name="duration" required>

<button type="submit">Create Exam</button>

</form>

</div>

</body>
</html>