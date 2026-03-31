package controller;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/edit-exam")
public class EditExamServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
        QuestionDAO questionDAO = new QuestionDAO();

        Exam exam = examDAO.getExamById(examId);

        if (exam == null) {
            response.sendRedirect("view-exams?error=invalidExam");
            return;
        }

        List<Question> questions = questionDAO.getQuestionsByExamOrdered(examId);

        request.setAttribute("exam", exam);
        request.setAttribute("questionList", questions);

        request.getRequestDispatcher("edit-exam.jsp").forward(request, response);
    }
}
