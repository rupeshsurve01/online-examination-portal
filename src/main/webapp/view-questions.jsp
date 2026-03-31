<%@page import="model.Question"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Questions</title>
<style>
*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body{
background:
radial-gradient(circle at top left, rgba(99,102,241,0.14), transparent 28%),
linear-gradient(180deg,#eef2ff 0%,#f8fafc 100%);
color:#1f2937;
}

.container{
display:flex;
min-height:calc(100vh - 65px);
}

.main{
flex:1;
padding:36px;
overflow:auto;
}

.hero{
display:flex;
justify-content:space-between;
align-items:flex-start;
gap:20px;
padding:28px;
margin-bottom:26px;
border-radius:24px;
background:linear-gradient(135deg,#1e293b,#4338ca);
color:white;
box-shadow:0 22px 45px rgba(30,41,59,0.18);
}

.hero-text h1{
font-size:30px;
font-weight:700;
margin-bottom:10px;
}

.hero-text p{
max-width:720px;
line-height:1.6;
color:rgba(255,255,255,0.84);
}

.hero-meta{
display:grid;
grid-template-columns:repeat(2,minmax(130px,1fr));
gap:12px;
min-width:280px;
}

.meta-card{
padding:16px;
border-radius:18px;
background:rgba(255,255,255,0.14);
border:1px solid rgba(255,255,255,0.16);
backdrop-filter:blur(10px);
}

.meta-card span{
display:block;
font-size:12px;
text-transform:uppercase;
letter-spacing:0.8px;
color:rgba(255,255,255,0.7);
margin-bottom:6px;
}

.meta-card strong{
font-size:20px;
font-weight:700;
}

.questions-grid{
display:grid;
gap:22px;
}

.question-card{
background:rgba(255,255,255,0.96);
border:1px solid rgba(148,163,184,0.18);
border-radius:22px;
padding:24px;
box-shadow:0 14px 34px rgba(15,23,42,0.08);
}

.question-top{
display:flex;
justify-content:space-between;
align-items:flex-start;
gap:16px;
margin-bottom:18px;
}

.question-number{
display:inline-flex;
align-items:center;
justify-content:center;
width:44px;
height:44px;
border-radius:14px;
background:linear-gradient(135deg,#4f46e5,#7c3aed);
color:white;
font-size:15px;
font-weight:700;
flex-shrink:0;
}

.question-text{
flex:1;
font-size:18px;
line-height:1.6;
font-weight:600;
color:#0f172a;
}

.correct-badge{
padding:8px 14px;
border-radius:999px;
background:#dcfce7;
color:#166534;
font-size:13px;
font-weight:700;
white-space:nowrap;
}

.options-list{
display:grid;
grid-template-columns:repeat(2,minmax(0,1fr));
gap:14px;
}

.option-card{
padding:16px;
border-radius:16px;
border:1px solid #e2e8f0;
background:#f8fafc;
transition:transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
}

.option-card:hover{
transform:translateY(-2px);
box-shadow:0 10px 24px rgba(15,23,42,0.08);
border-color:#c7d2fe;
}

.option-card.correct{
background:linear-gradient(135deg,#ecfdf5,#d1fae5);
border-color:#6ee7b7;
}

.option-label{
display:inline-flex;
align-items:center;
justify-content:center;
width:32px;
height:32px;
margin-bottom:10px;
border-radius:10px;
background:#e2e8f0;
color:#334155;
font-size:13px;
font-weight:700;
}

.option-card.correct .option-label{
background:#10b981;
color:white;
}

.option-text{
font-size:15px;
line-height:1.6;
color:#334155;
}

.empty-state{
padding:48px 24px;
text-align:center;
border-radius:22px;
background:white;
border:1px dashed #cbd5e1;
box-shadow:0 14px 34px rgba(15,23,42,0.06);
color:#64748b;
}

.empty-state h3{
font-size:22px;
margin-bottom:8px;
color:#0f172a;
}

@media (max-width: 992px){
.hero{
flex-direction:column;
}

.hero-meta{
width:100%;
min-width:0;
}

.options-list{
grid-template-columns:1fr;
}
}

@media (max-width: 768px){
.main{
padding:22px 16px;
}

.hero{
padding:22px 18px;
border-radius:20px;
}

.hero-text h1{
font-size:24px;
}

.hero-meta{
grid-template-columns:1fr 1fr;
}

.question-card{
padding:18px;
border-radius:18px;
}

.question-top{
flex-direction:column;
}
}
</style>
</head>
<body>
<%
    List<Question> questions = (List<Question>) request.getAttribute("questionList");
    model.Exam exam = (model.Exam) request.getAttribute("exam");
    String examTitle = exam != null ? exam.getTitle() : "Exam Questions";
    String examId = exam != null ? String.valueOf(exam.getId()) : "-";
    String duration = exam != null ? exam.getDuration() + " minutes" : "-";
    int totalQuestions = questions != null ? questions.size() : 0;
%>

<jsp:include page="components/header.jsp"/>

<div class="container">
<jsp:include page="components/sidebar.jsp"/>

<div class="main">

<section class="hero">
    <div class="hero-text">
        <h1><%= examTitle %></h1>
        <p>This page shows every question configured for the selected exam so you can review the question text, all answer choices, and the marked correct option in one place.</p>
    </div>

    <div class="hero-meta">
        <div class="meta-card">
            <span>Exam ID</span>
            <strong><%= examId %></strong>
        </div>
        <div class="meta-card">
            <span>Total Questions</span>
            <strong><%= totalQuestions %></strong>
        </div>
        <div class="meta-card">
            <span>Duration</span>
            <strong><%= duration %></strong>
        </div>
        <div class="meta-card">
            <span>View Mode</span>
            <strong>Review</strong>
        </div>
    </div>
</section>

<section class="questions-grid">
<%
if (questions != null && !questions.isEmpty()) {
    int index = 1;
    for (Question q : questions) {
%>
    <article class="question-card">
        <div class="question-top">
            <div class="question-number">Q<%= index %></div>
            <div class="question-text"><%= q.getQuestionText() %></div>
            <div class="correct-badge">Correct: Option <%= q.getCorrectOption() %></div>
        </div>

        <div class="options-list">
            <div class="option-card <%= q.getCorrectOption() == 1 ? "correct" : "" %>">
                <span class="option-label">A</span>
                <div class="option-text"><%= q.getOption1() %></div>
            </div>

            <div class="option-card <%= q.getCorrectOption() == 2 ? "correct" : "" %>">
                <span class="option-label">B</span>
                <div class="option-text"><%= q.getOption2() %></div>
            </div>

            <div class="option-card <%= q.getCorrectOption() == 3 ? "correct" : "" %>">
                <span class="option-label">C</span>
                <div class="option-text"><%= q.getOption3() %></div>
            </div>

            <div class="option-card <%= q.getCorrectOption() == 4 ? "correct" : "" %>">
                <span class="option-label">D</span>
                <div class="option-text"><%= q.getOption4() %></div>
            </div>
        </div>
    </article>
<%
        index++;
    }
} else {
%>
    <div class="empty-state">
        <h3>No questions added yet</h3>
        <p>This exam does not have any questions right now. Add questions first to see them listed here.</p>
    </div>
<%
}
%>
</section>

</div>
</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>
