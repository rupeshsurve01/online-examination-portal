package controller;

import java.io.IOException;

import dao.ExamDAO;
import dao.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Exam;
import model.Question;
import model.User;

@WebServlet("/edit-question")
public class EditQuestionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
        ExamDAO examDAO = new ExamDAO();
        Question question = questionDAO.getQuestionById(questionId);
        Exam exam = examDAO.getExamById(examId);

        if (question == null || exam == null || question.getExamId() != examId) {
            response.sendRedirect("edit-exam?examId=" + examId + "&error=invalidQuestion");
            return;
        }

        request.setAttribute("question", question);
        request.setAttribute("exam", exam);

        request.getRequestDispatcher("edit-question.jsp").forward(request, response);
    }
}
