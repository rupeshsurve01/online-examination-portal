<%@page import="model.Exam"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Exams</title>
<style>
*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body{
background:linear-gradient(180deg,#eef2ff 0%,#f8fafc 100%);
color:#1f2937;
}

.container{
display:flex;
min-height:calc(100vh - 65px);
}

.main{
flex:1;
padding:38px;
overflow:auto;
}

.page-header{
display:flex;
justify-content:space-between;
align-items:flex-end;
gap:16px;
margin-bottom:24px;
}

.page-header h1{
font-size:30px;
font-weight:700;
color:#18212f;
margin-bottom:6px;
}

.page-header p{
color:#64748b;
font-size:15px;
}

.table-card{
background:rgba(255,255,255,0.94);
border:1px solid rgba(148,163,184,0.18);
border-radius:20px;
padding:22px;
box-shadow:0 18px 45px rgba(15,23,42,0.08);
backdrop-filter:blur(6px);
}

.table-wrapper{
overflow-x:auto;
}

table{
width:100%;
border-collapse:collapse;
min-width:760px;
}

th{
background:linear-gradient(135deg,#4f46e5,#7c3aed);
color:white;
padding:15px 16px;
font-size:14px;
font-weight:600;
letter-spacing:0.3px;
text-transform:uppercase;
}

th:first-child{
border-top-left-radius:14px;
}

th:last-child{
border-top-right-radius:14px;
}

td{
padding:16px;
text-align:center;
border-bottom:1px solid #e2e8f0;
font-size:15px;
}

tr:last-child td{
border-bottom:none;
}

tbody tr{
transition:background 0.25s ease, transform 0.25s ease;
}

tbody tr:hover{
background:#f8faff;
}

.title-cell{
font-weight:600;
color:#1e293b;
}

.category-badge{
display:inline-block;
padding:6px 12px;
border-radius:999px;
background:#ede9fe;
color:#5b21b6;
font-size:13px;
font-weight:600;
}

.duration-text{
color:#475569;
font-weight:600;
}

.action-btn{
display:inline-block;
padding:9px 14px;
border-radius:10px;
font-size:13px;
font-weight:600;
text-decoration:none;
color:white;
transition:transform 0.2s ease, box-shadow 0.2s ease, opacity 0.2s ease;
border:none;
cursor:pointer;
}

.action-btn:hover{
transform:translateY(-2px);
box-shadow:0 10px 20px rgba(15,23,42,0.14);
}

.edit-btn{
background:linear-gradient(135deg,#2563eb,#3b82f6);
}

.delete-btn{
background:linear-gradient(135deg,#dc2626,#ef4444);
}

.view-btn{
background:linear-gradient(135deg,#059669,#10b981);
}

.inline-form{
display:inline;
}

.empty-state{
text-align:center;
padding:28px 16px;
color:#64748b;
font-size:15px;
}

@media (max-width: 768px){
.main{
padding:24px 16px;
}

.page-header{
align-items:flex-start;
flex-direction:column;
}

.page-header h1{
font-size:24px;
}

.table-card{
padding:16px;
border-radius:16px;
}
}
</style>
</head>
<body>

<%
	List<Exam> exams = (List<Exam>) request.getAttribute("examList");
    String msg = request.getParameter("msg");
    String error = request.getParameter("error");
%> 

	<jsp:include page="components/header.jsp"/>
	
	<div class="container">
	
	<jsp:include page="components/sidebar.jsp"/>
	
	<div class="main">
	<div class="page-header">
		<div>
			<h1>Manage Exams</h1>
			<p>Review the current exams and quickly access edit, delete, or preview actions.</p>
		</div>
	</div>

        <%
        if ("examDeleted".equals(msg)) {
        %>
        <div style="margin-bottom:18px; padding:12px 14px; border-radius:12px; background:#dcfce7; color:#166534; font-weight:600;">
            Exam deleted successfully.
        </div>
        <%
        } else if ("deleteFailed".equals(error)) {
        %>
        <div style="margin-bottom:18px; padding:12px 14px; border-radius:12px; background:#fee2e2; color:#b91c1c; font-weight:600;">
            Exam deletion failed.
        </div>
        <%
        }
        %>
	
		<div class="table-card">
		<div class="table-wrapper">
		<table>
			<thead>
			<tr>
				<th>Exam ID</th>
				<th>Title</th>
				<th>Category</th>
				<th>Duration</th>
				<th>Edit</th>
				<th>Delete</th>
				<th>Preview</th>
			</tr>
			</thead>
			<tbody>
				<%
					if(exams != null){
						for(Exam exam : exams){
				%>	
				
				<tr>
					<td><%= exam.getId() %></td>
					<td class="title-cell"><%= exam.getTitle() %></td>
					<td><span class="category-badge"><%= exam.getCategory() %></span></td>
					<td class="duration-text"><%= exam.getDuration() %> minutes</td>
					<td>
					<a class="action-btn edit-btn" href="edit-exam?examId=<%= exam.getId() %>">
					Edit Exam
					</a>
					</td>
					<td>
                    <form class="inline-form" action="delete-exam" method="post" onsubmit="return confirm('Delete this exam and all its questions/results?');">
                    <input type="hidden" name="examId" value="<%= exam.getId() %>">
                    <button class="action-btn delete-btn" type="submit">Delete Exam</button>
                    </form>
					</td>
					<td>
					<a class="action-btn view-btn" href="view-questions?examId=<%= exam.getId() %>">
					Preview Questions
					</a>
					</td>
					
				</tr>
				
				<%
						}
					}
					else{
				%>
				<tr>
					<td colspan="7" class="empty-state">No exams are available right now.</td>
				</tr>
				<%
					}
				%>		
					
				</tbody>
		</table>
		</div>
		</div>
	</div>
	</div>
</body>
</html>
