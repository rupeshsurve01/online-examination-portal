package controller;

import java.io.IOException;

import dao.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet("/delete-question")
public class DeleteQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;

        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        String examIdParam = request.getParameter("examId");
        String questionIdParam = request.getParameter("questionId");
        int examId;
        int questionId;

        try {
            examId = Integer.parseInt(examIdParam);
            questionId = Integer.parseInt(questionIdParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("view-exams?error=invalidQuestion");
            return;
        }

        QuestionDAO questionDAO = new QuestionDAO();
        boolean deleted = questionDAO.deleteQuestion(questionId, examId);

        response.sendRedirect("edit-exam?examId=" + examId + (deleted ? "&msg=questionDeleted" : "&error=questionDeleteFailed"));
    }
}
