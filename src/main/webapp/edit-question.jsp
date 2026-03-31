<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Exam" %>
<%@ page import="model.Question" %>
<%
Exam exam = (Exam) request.getAttribute("exam");
Question question = (Question) request.getAttribute("question");

if (exam == null || question == null) {
    response.sendRedirect("view-exams");
    return;
}

String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Question</title>
<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;}
body{background:linear-gradient(135deg,#dbeafe,#f8fafc);min-height:100vh;padding:32px;}
.wrap{max-width:760px;margin:0 auto;background:white;padding:28px;border-radius:18px;box-shadow:0 16px 36px rgba(15,23,42,0.10);}
h2{margin-bottom:8px;color:#0f172a;}
.sub{margin-bottom:20px;color:#475569;}
label{display:block;font-weight:600;margin:12px 0 6px;}
input,textarea{width:100%;padding:11px;border:1px solid #d6dbe5;border-radius:10px;font-size:14px;}
textarea{min-height:110px;resize:vertical;}
.actions{display:flex;gap:12px;flex-wrap:wrap;margin-top:18px;}
.btn{display:inline-block;border:none;border-radius:10px;padding:11px 16px;color:white;text-decoration:none;font-weight:600;cursor:pointer;}
.btn-primary{background:linear-gradient(135deg,#2563eb,#3b82f6);}
.btn-secondary{background:linear-gradient(135deg,#475569,#64748b);}
.message{padding:12px 14px;border-radius:12px;margin-bottom:18px;font-weight:600;background:#fee2e2;color:#b91c1c;}
</style>
</head>
<body>
<div class="wrap">
    <h2>Edit Question</h2>
    <p class="sub"><strong><%= exam.getTitle() %></strong> | Exam ID: <%= exam.getId() %></p>

    <%
    if ("invalidInput".equals(error)) {
    %>
    <div class="message">Please fill all fields and choose a correct option from 1 to 4.</div>
    <%
    }
    %>

    <form action="update-question" method="post">
        <input type="hidden" name="exam_id" value="<%= exam.getId() %>">
        <input type="hidden" name="question_id" value="<%= question.getId() %>">

        <label>Question</label>
        <textarea name="question" required><%= question.getQuestionText() %></textarea>

        <label>Option 1</label>
        <input type="text" name="option1" value="<%= question.getOption1() %>" required>

        <label>Option 2</label>
        <input type="text" name="option2" value="<%= question.getOption2() %>" required>

        <label>Option 3</label>
        <input type="text" name="option3" value="<%= question.getOption3() %>" required>

        <label>Option 4</label>
        <input type="text" name="option4" value="<%= question.getOption4() %>" required>

        <label>Correct Option</label>
        <input type="number" name="correct_option" min="1" max="4" value="<%= question.getCorrectOption() %>" required>

        <div class="actions">
            <button class="btn btn-primary" type="submit">Update Question</button>
            <a class="btn btn-secondary" href="edit-exam?examId=<%= exam.getId() %>">Back to Exam</a>
        </div>
    </form>
</div>
</body>
</html>
