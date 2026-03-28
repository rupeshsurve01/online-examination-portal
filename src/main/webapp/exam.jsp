<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Question" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body{
background:#f4f6fb;
padding:25px;
}

/* HEADER */

.header{
background:linear-gradient(135deg,#667eea,#764ba2);
color:white;
padding:18px 30px;
margin-bottom:25px;
border-radius:10px;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 6px 15px rgba(0,0,0,0.1);
}

.header h2{
font-weight:600;
}

.timer{
background:#ff4b5c;
padding:8px 18px;
border-radius:20px;
font-weight:bold;
}

/* EXAM CONTAINER */

.exam-container{
max-width:900px;
margin:auto;
}

/* QUESTION CARD */

.question-card{
background:white;
padding:25px;
margin-bottom:20px;
border-radius:12px;
box-shadow:0 8px 18px rgba(0,0,0,0.08);
transition:0.3s;
}

.question-card:hover{
transform:translateY(-3px);
}

.question-card p{
margin-bottom:15px;
font-size:17px;
color:#333;
}

/* OPTIONS */

.option{
padding:10px;
border-radius:6px;
transition:0.2s;
}

.option:hover{
background:#f1f3ff;
}

.option input{
margin-right:10px;
}

/* SUBMIT BUTTON */

.submit-btn{
display:block;
margin:35px auto;
background:linear-gradient(135deg,#27ae60,#2ecc71);
color:white;
border:none;
padding:14px 35px;
font-size:16px;
border-radius:8px;
cursor:pointer;
transition:0.3s;
}

.submit-btn:hover{
transform:translateY(-2px);
box-shadow:0 6px 15px rgba(0,0,0,0.2);
}

</style>

</head>

<body>

<script>

let minutes = <%= ((model.Exam)request.getAttribute("exam")).getDuration() %>;
let seconds = minutes * 60;

let timer = setInterval(function(){

    let m = Math.floor(seconds / 60);
    let s = seconds % 60;

    document.getElementById("timer").innerText = m + ":" + (s < 10 ? "0"+s : s);

    seconds--;

    if(seconds < 0){
        clearInterval(timer);
        alert("Time Up! Exam Submitted");
        document.getElementById("examForm").submit();
    }

},1000);

</script>

<div class="header">
<h2>Online Examination</h2>
<div class="timer">⏱ Time Remaining: <span id="timer"></span></div>
</div>

<div class="exam-container">

<%
List<Question> questions = (List<Question>) request.getAttribute("questions");
%>

<form id="examForm" action="submit-exam" method="post">

<input type="hidden" name="examId" value="<%= request.getParameter("examId") %>">
<input type="hidden" name="rtime" value="<%= request.getParameter("rtime") %>">

<%
for(Question q : questions){
%>

<div class="question-card">

<p><b><%= q.getQuestionText() %></b></p>

<label class="option">
<input type="radio" name="q<%= q.getId() %>" value="1"> <%= q.getOption1() %>
</label>

<label class="option">
<input type="radio" name="q<%= q.getId() %>" value="2"> <%= q.getOption2() %>
</label>

<label class="option">
<input type="radio" name="q<%= q.getId() %>" value="3"> <%= q.getOption3() %>
</label>

<label class="option">
<input type="radio" name="q<%= q.getId() %>" value="4"> <%= q.getOption4() %>
</label>

</div>

<%
}
%>

<button class="submit-btn" type="submit">Submit Exam</button>

</form>

</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>

