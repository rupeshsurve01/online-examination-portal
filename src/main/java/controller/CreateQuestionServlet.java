package controller;

import java.io.IOException;
import java.sql.SQLException;

import dao.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Question;

@WebServlet("/create-question")
public class CreateQuestionServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException,ServletException{
		
		Question q = new Question();
		
		q.setQuestionText(request.getParameter("question"));
		q.setOption1(request.getParameter("option1"));
		q.setOption2(request.getParameter("option2"));
		q.setOption3(request.getParameter("option3"));
		q.setOption4(request.getParameter("option4"));
		q.setCorrectOption(Integer.parseInt(request.getParameter("corect_option")));
		
		QuestionDAO dao = new QuestionDAO();
		dao.createQuestion(q);
		
		response.sendRedirect("/create-question");
	}
}
