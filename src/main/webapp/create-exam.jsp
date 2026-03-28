<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Exam</title>

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
background:linear-gradient(135deg,#4facfe,#00f2fe);
}

/* CARD */

.container{
width:380px;
background:rgba(255,255,255,0.95);
padding:35px;
border-radius:14px;
box-shadow:0 15px 35px rgba(0,0,0,0.2);
backdrop-filter:blur(10px);
animation:fadeIn 0.6s ease;
}

/* TITLE */

h2{
text-align:center;
margin-bottom:25px;
color:#2c3e50;
font-weight:600;
letter-spacing:0.5px;
}

/* LABEL */

label{
display:block;
font-weight:600;
margin-bottom:6px;
margin-top:14px;
color:#444;
}

/* INPUT */

input, select{
width:100%;
padding:11px;
border:1px solid #dcdcdc;
border-radius:6px;
font-size:14px;
transition:0.25s;
}

input:focus, select:focus{
border-color:#4facfe;
box-shadow:0 0 5px rgba(79,172,254,0.4);
outline:none;
}

/* BUTTON */

button{
width:100%;
margin-top:22px;
padding:13px;
border:none;
border-radius:7px;
background:linear-gradient(135deg,#4facfe,#00c6ff);
color:white;
font-size:16px;
font-weight:600;
cursor:pointer;
transition:0.3s;
}

button:hover{
transform:translateY(-2px);
box-shadow:0 6px 15px rgba(0,0,0,0.15);
}

/* ANIMATION */

@keyframes fadeIn{
from{
opacity:0;
transform:translateY(20px);
}
to{
opacity:1;
transform:translateY(0);
}
}

</style>

</head>

<body>

<div class="container">

<h2>Create Exam</h2>

<form action="create-exam" method="post">

<label>Exam Title</label>
<input type="text" name="title" placeholder="Enter exam title" required>

<label>Duration (minutes)</label>
<input type="number" name="duration" placeholder="Enter exam duration" required>

<label>Category</label>
<select name="category" required>
    <option value="">Select exam category</option>
    <option value="General">General</option>
    <option value="Math">Math</option>
    <option value="Science">Science</option>
    <option value="English">English</option>
    <option value="Computer Science">Computer Science</option>
</select>

<button type="submit">Create Exam</button>

</form>

</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>

