package controller;

import java.io.IOException;

import dao.ExamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Exam;
import model.User;

@WebServlet("/update-exam")
public class UpdateExamServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;

        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        String examIdParam = request.getParameter("examId");
        String title = request.getParameter("title");
        String durationParam = request.getParameter("duration");
        String category = request.getParameter("category");
        int examId;
        int duration;

        try {
            examId = Integer.parseInt(examIdParam);
            duration = Integer.parseInt(durationParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("edit-exam?examId=" + examIdParam + "&error=invalidExam");
            return;
        }

        if (title == null || title.trim().isEmpty() || category == null || category.trim().isEmpty() || duration <= 0) {
            response.sendRedirect("edit-exam?examId=" + examId + "&error=invalidInput");
            return;
        }

        Exam exam = new Exam();
        exam.setId(examId);
        exam.setTitle(title.trim());
        exam.setDuration(duration);
        exam.setCategory(category.trim());

        ExamDAO examDAO = new ExamDAO();
        boolean updated = examDAO.updateExam(exam);

        response.sendRedirect("edit-exam?examId=" + examId + (updated ? "&msg=updated" : "&error=updateFailed"));
    }
}
