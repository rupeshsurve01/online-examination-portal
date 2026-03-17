package controller;

import java.io.IOException;

import dao.ExamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/create-exam")
public class CreateExamServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        int duration = Integer.parseInt(request.getParameter("duration"));

        ExamDAO dao = new ExamDAO();
        int examId = dao.createExam(title, duration);

        response.sendRedirect("add-question.jsp?examId=" + examId);
    }
}
