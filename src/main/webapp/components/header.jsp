<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.header{
background:linear-gradient(135deg,#667eea,#764ba2);
color:white;
padding:15px 30px;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

.header h2{
margin:0;
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
</style>

<div class="header">
    <h2>Online Examination Portal</h2>
    <a href="<%= request.getContextPath() %>/logout">Logout</a>
</div>
