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
import model.Exam;
import model.Question;

@WebServlet("/start-exam")
public class StartExamServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int examId = Integer.parseInt(request.getParameter("examId"));

        QuestionDAO questionDAO = new QuestionDAO();
        ExamDAO examDAO = new ExamDAO();

        List<Question> questions = null;
        Exam exam = null;

        try {
            questions = questionDAO.getQuestionsByExam(examId);
            exam = examDAO.getExamById(examId);   // get exam info
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("questions", questions);
        request.setAttribute("exam", exam);  // send exam to JSP

        request.getRequestDispatcher("exam.jsp").forward(request, response);
    }
}
