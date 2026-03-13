package controller;

import dao.QuestionDAO;
import model.Question;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/submit-exam")
public class SubmitExamServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int examId = Integer.parseInt(request.getParameter("examId"));

        QuestionDAO dao = new QuestionDAO();
        List<Question> questions = dao.getQuestionsByExam(examId);

        int score = 0;

        for(Question q : questions){

            String answer = request.getParameter("q" + q.getId());

            if(answer != null){

                int selected = Integer.parseInt(answer);

                if(selected == q.getCorrectOption()){
                    score++;
                }
            }
        }

        request.setAttribute("score", score);

        request.getRequestDispatcher("result.jsp").forward(request,response);
    }
}