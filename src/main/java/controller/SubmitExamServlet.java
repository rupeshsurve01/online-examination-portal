package controller;

import dao.QuestionDAO;
import dao.ResultDAO;
import model.Question;
import model.Result;
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

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if(user == null){
            response.sendRedirect("login.jsp");
            return;
        }

        int studentId = user.getId();

        ResultDAO resultDAO = new ResultDAO();

        resultDAO.saveResult(studentId, examId, score);

        List<Result> results = resultDAO.getResultsByStudent(studentId);

        // Send to JSP
        request.setAttribute("resultList", results);

        request.getRequestDispatcher("results.jsp").forward(request,response);
    }
}