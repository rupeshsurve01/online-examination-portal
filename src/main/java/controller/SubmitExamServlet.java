package controller;

import dao.QuestionDAO;
import dao.ResultDAO;
import model.Question;
import model.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/submit-exam")
public class SubmitExamServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;

        if(user == null){
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

        QuestionDAO dao = new QuestionDAO();
        List<Question> questions = dao.getQuestionsByExam(examId);

        if (questions == null || questions.isEmpty()) {
            response.sendRedirect("view-exams?error=noQuestions");
            return;
        }

        int score = 0;

        for(Question q : questions){

            String answer = request.getParameter("q" + q.getId());

            if(answer != null){

                int selected;

                try {
                    selected = Integer.parseInt(answer);
                } catch (NumberFormatException e) {
                    continue;
                }

                if(selected == q.getCorrectOption()){
                    score++;
                }
            }
        }

        int studentId = user.getId();

        ResultDAO resultDAO = new ResultDAO();

        resultDAO.saveResult(studentId, examId, score);
        response.sendRedirect("view-results?msg=submitted");
    }
}
