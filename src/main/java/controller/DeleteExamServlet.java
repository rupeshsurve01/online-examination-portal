package controller;

import java.io.IOException;

import dao.ExamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet("/delete-exam")
public class DeleteExamServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;

        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        String examIdParam = request.getParameter("examId");
        int examId;

        try {
            examId = Integer.parseInt(examIdParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("view-exams?error=invalidExam");
            return;
        }

        ExamDAO examDAO = new ExamDAO();
        boolean deleted = examDAO.deleteExam(examId);

        response.sendRedirect("view-exams" + (deleted ? "?msg=examDeleted" : "?error=deleteFailed"));
    }
}
