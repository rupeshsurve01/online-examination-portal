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
        String durationParam = request.getParameter("duration");
        String category = request.getParameter("category");

        if (title == null || title.trim().isEmpty()) {
            response.sendRedirect("create-exam.jsp?error=invalidTitle");
            return;
        }

        int duration;

        try {
            duration = Integer.parseInt(durationParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("create-exam.jsp?error=invalidDuration");
            return;
        }

        if (duration <= 0) {
            response.sendRedirect("create-exam.jsp?error=invalidDuration");
            return;
        }

        ExamDAO dao = new ExamDAO();
        int examId = dao.createExam(title.trim(), duration, category);

        if (examId <= 0) {
            response.sendRedirect("create-exam.jsp?error=createFailed");
            return;
        }

        response.sendRedirect("add-question.jsp?examId=" + examId);
    }
}
