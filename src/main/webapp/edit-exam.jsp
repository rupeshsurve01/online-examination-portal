<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Exam" %>
<%@ page import="model.Question" %>
<%
Exam exam = (Exam) request.getAttribute("exam");
List<Question> questions = (List<Question>) request.getAttribute("questionList");

if (exam == null) {
    response.sendRedirect("view-exams");
    return;
}

String msg = request.getParameter("msg");
String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Exam</title>
<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;}
body{background:linear-gradient(180deg,#eef2ff 0%,#f8fafc 100%);color:#1f2937;}
.container{display:flex;min-height:calc(100vh - 65px);}
.main{flex:1;padding:32px;}
.grid{display:grid;grid-template-columns:1.1fr 1fr;gap:24px;align-items:start;}
.card{background:white;border-radius:18px;padding:24px;box-shadow:0 14px 34px rgba(15,23,42,0.08);}
.card h2,.card h3{margin-bottom:18px;color:#0f172a;}
label{display:block;font-weight:600;margin:12px 0 6px;}
input,select,textarea{width:100%;padding:11px;border:1px solid #d6dbe5;border-radius:10px;font-size:14px;}
textarea{resize:vertical;min-height:100px;}
.btn{display:inline-block;border:none;border-radius:10px;padding:11px 16px;color:white;text-decoration:none;font-weight:600;cursor:pointer;}
.btn-primary{background:linear-gradient(135deg,#2563eb,#3b82f6);}
.btn-success{background:linear-gradient(135deg,#059669,#10b981);}
.btn-danger{background:linear-gradient(135deg,#dc2626,#ef4444);}
.btn-secondary{background:linear-gradient(135deg,#475569,#64748b);}
.actions{display:flex;gap:10px;flex-wrap:wrap;margin-top:18px;}
.message{padding:12px 14px;border-radius:12px;margin-bottom:18px;font-weight:600;}
.message.success{background:#dcfce7;color:#166534;}
.message.error{background:#fee2e2;color:#b91c1c;}
.question-list{display:grid;gap:16px;}
.question-item{border:1px solid #e2e8f0;border-radius:16px;padding:18px;background:#f8fafc;}
.question-item h4{margin-bottom:10px;color:#0f172a;}
.meta{font-size:13px;color:#475569;margin-bottom:12px;}
.inline-form{display:inline;}
.empty{padding:22px;border-radius:14px;background:#f8fafc;color:#64748b;border:1px dashed #cbd5e1;}
@media (max-width: 980px){.grid{grid-template-columns:1fr;}.main{padding:20px 16px;}}
</style>
</head>
<body>
<jsp:include page="components/header.jsp"/>
<div class="container">
<jsp:include page="components/sidebar.jsp"/>
<div class="main">

<%
if ("updated".equals(msg) || "questionAdded".equals(msg) || "questionUpdated".equals(msg) || "questionDeleted".equals(msg) || "created".equals(msg)) {
%>
<div class="message success">
<%= "updated".equals(msg) ? "Exam details updated." :
    "questionAdded".equals(msg) ? "Question added." :
    "questionUpdated".equals(msg) ? "Question updated." :
    "questionDeleted".equals(msg) ? "Question deleted." : "Exam created successfully." %>
</div>
<%
} else if (error != null) {
%>
<div class="message error">
<%= "invalidInput".equals(error) ? "Please fill all required exam/question fields correctly." :
    "invalidQuestion".equals(error) ? "Question not found for this exam." :
    "questionUpdateFailed".equals(error) ? "Question update failed." :
    "questionDeleteFailed".equals(error) ? "Question deletion failed." :
    "updateFailed".equals(error) ? "Exam update failed." : "Something went wrong." %>
</div>
<%
}
%>

<div class="grid">
    <section class="card">
        <h2>Edit Exam</h2>
        <form action="update-exam" method="post">
            <input type="hidden" name="examId" value="<%= exam.getId() %>">

            <label>Exam Title</label>
            <input type="text" name="title" value="<%= exam.getTitle() %>" required>

            <label>Duration (minutes)</label>
            <input type="number" name="duration" min="1" value="<%= exam.getDuration() %>" required>

            <label>Category</label>
            <select name="category" required>
                <option value="General" <%= "General".equalsIgnoreCase(exam.getCategory()) ? "selected" : "" %>>General</option>
                <option value="Math" <%= "Math".equalsIgnoreCase(exam.getCategory()) ? "selected" : "" %>>Math</option>
                <option value="Science" <%= "Science".equalsIgnoreCase(exam.getCategory()) ? "selected" : "" %>>Science</option>
                <option value="English" <%= "English".equalsIgnoreCase(exam.getCategory()) ? "selected" : "" %>>English</option>
                <option value="Computer Science" <%= "Computer Science".equalsIgnoreCase(exam.getCategory()) ? "selected" : "" %>>Computer Science</option>
            </select>

            <div class="actions">
                <button class="btn btn-primary" type="submit">Update Exam</button>
                <a class="btn btn-secondary" href="view-exams">Back to Exams</a>
            </div>
        </form>
        <div class="actions">
            <form class="inline-form" action="delete-exam" method="post" onsubmit="return confirm('Delete this exam and all its questions/results?');">
                <input type="hidden" name="examId" value="<%= exam.getId() %>">
                <button class="btn btn-danger" type="submit">Delete Exam</button>
            </form>
        </div>
    </section>

    <section class="card">
        <h2>Add Question</h2>
        <form action="create-question" method="post">
            <input type="hidden" name="exam_id" value="<%= exam.getId() %>">

            <label>Question</label>
            <textarea name="question" required></textarea>

            <label>Option 1</label>
            <input type="text" name="option1" required>

            <label>Option 2</label>
            <input type="text" name="option2" required>

            <label>Option 3</label>
            <input type="text" name="option3" required>

            <label>Option 4</label>
            <input type="text" name="option4" required>

            <label>Correct Option</label>
            <input type="number" name="correct_option" min="1" max="4" required>

            <div class="actions">
                <button class="btn btn-success" type="submit">Add Question</button>
            </div>
        </form>
    </section>
</div>

<section class="card" style="margin-top:24px;">
    <h3>Manage Questions</h3>

    <%
    if (questions == null || questions.isEmpty()) {
    %>
    <div class="empty">No questions added yet for this exam.</div>
    <%
    } else {
        int index = 1;
        for (Question q : questions) {
    %>
    <article class="question-item">
        <h4>Question <%= index %></h4>
        <div class="meta">Correct option: <strong><%= q.getCorrectOption() %></strong></div>
        <p style="margin-bottom:12px;"><strong><%= q.getQuestionText() %></strong></p>
        <p>1. <%= q.getOption1() %></p>
        <p>2. <%= q.getOption2() %></p>
        <p>3. <%= q.getOption3() %></p>
        <p>4. <%= q.getOption4() %></p>

        <div class="actions">
            <a class="btn btn-primary" href="edit-question?examId=<%= exam.getId() %>&questionId=<%= q.getId() %>">Edit Question</a>
            <form class="inline-form" action="delete-question" method="post" onsubmit="return confirm('Delete this question?');">
                <input type="hidden" name="examId" value="<%= exam.getId() %>">
                <input type="hidden" name="questionId" value="<%= q.getId() %>">
                <button class="btn btn-danger" type="submit">Delete Question</button>
            </form>
        </div>
    </article>
    <%
            index++;
        }
    }
    %>
</section>

</div>
</div>
<jsp:include page="components/footer.jsp"/>
</body>
</html>
