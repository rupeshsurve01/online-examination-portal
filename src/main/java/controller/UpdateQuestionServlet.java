package controller;

import java.io.IOException;

import dao.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Question;
import model.User;

@WebServlet("/update-question")
public class UpdateQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;

        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        String examIdParam = request.getParameter("exam_id");
        String questionIdParam = request.getParameter("question_id");
        String questionText = request.getParameter("question");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String correctOptionParam = request.getParameter("correct_option");
        int examId;
        int questionId;
        int correctOption;

        try {
            examId = Integer.parseInt(examIdParam);
            questionId = Integer.parseInt(questionIdParam);
            correctOption = Integer.parseInt(correctOptionParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("edit-exam?examId=" + examIdParam + "&error=invalidQuestion");
            return;
        }

        if (questionText == null || questionText.trim().isEmpty()
                || option1 == null || option1.trim().isEmpty()
                || option2 == null || option2.trim().isEmpty()
                || option3 == null || option3.trim().isEmpty()
                || option4 == null || option4.trim().isEmpty()
                || correctOption < 1 || correctOption > 4) {
            response.sendRedirect("edit-question?examId=" + examId + "&questionId=" + questionId + "&error=invalidInput");
            return;
        }

        Question question = new Question();
        question.setId(questionId);
        question.setExamId(examId);
        question.setQuestionText(questionText.trim());
        question.setOption1(option1.trim());
        question.setOption2(option2.trim());
        question.setOption3(option3.trim());
        question.setOption4(option4.trim());
        question.setCorrectOption(correctOption);

        QuestionDAO questionDAO = new QuestionDAO();
        boolean updated = questionDAO.updateQuestion(question);

        response.sendRedirect("edit-exam?examId=" + examId + (updated ? "&msg=questionUpdated" : "&error=questionUpdateFailed"));
    }
}
