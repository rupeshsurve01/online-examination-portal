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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		int examId = Integer.parseInt(request.getParameter("examId"));

		QuestionDAO dao = new QuestionDAO();
		List<Question> questions = dao.getQuestionsByExam(examId);

		ExamDAO examDAO = new ExamDAO();
		Exam exam = examDAO.getExamById(examId);

		request.setAttribute("exam", exam);
		request.setAttribute("questionList", questions);

		request.getRequestDispatcher("exam.jsp").forward(request,response);
	}
}
