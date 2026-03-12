<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List" %>
<%@ page import="model.Exam" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
List<Exam> exams = (List<Exam>) request.getAttribute("examList");
%>

<h2>Available Exams</h2>

<table border="1">

<tr>
<th>Exam ID</th>
<th>Title</th>
<th>Duration</th>
<th>Action</th>
</tr>

<%
if(exams != null){
for(Exam exam : exams){
%>

<tr>
<td><%= exam.getId() %></td>
<td><%= exam.getTitle() %></td>
<td><%= exam.getDuration() %> minutes</td>
<td>
<a href="start-exam?examId=<%= exam.getId() %>">Start Exam</a></td>
</tr>

<%
}
}
%>

</table>

</body>
</html>