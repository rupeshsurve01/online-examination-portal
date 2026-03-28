<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>

<%
int currentYear = Calendar.getInstance().get(Calendar.YEAR);
%>

<style>
.footer{
margin-top:32px;
background:linear-gradient(135deg,#0f172a,#1e293b);
color:#cbd5e1;
padding:0;
box-shadow:0 -8px 24px rgba(15,23,42,0.12);
}

.container + .footer{
margin-top:0;
margin-left:240px;
width:calc(100% - 240px);
}

.footer-accent{
height:4px;
background:linear-gradient(90deg,#38bdf8,#22c55e,#f59e0b);
}

.footer-content{
max-width:1100px;
margin:0 auto;
padding:22px 24px 18px;
display:flex;
justify-content:space-between;
align-items:center;
gap:18px;
flex-wrap:wrap;
}

.footer-brand h3{
margin:0 0 6px;
font-size:18px;
font-weight:700;
color:#ffffff;
}

.footer-brand p,
.footer-meta p{
margin:0;
font-size:14px;
line-height:1.6;
}

.footer-meta{
text-align:right;
}

.footer-meta .highlight{
color:#7dd3fc;
font-weight:600;
}

@media (max-width: 768px){
.container + .footer{
margin-left:0;
width:100%;
}

.footer-content{
padding:20px 16px;
text-align:center;
justify-content:center;
}

.footer-meta{
text-align:center;
}
}
</style>

<footer class="footer">
    <div class="footer-accent"></div>
    <div class="footer-content">
        <div class="footer-brand">
            <h3>Online Examination Portal</h3>
            <p>Secure exams, smooth evaluation, and simple result tracking in one place.</p>
        </div>
        <div class="footer-meta">
            <p><span class="highlight">ExamNova</span> academic platform</p>
            <p>&copy; <%= currentYear %> All rights reserved.</p>
        </div>
    </div>
</footer>
