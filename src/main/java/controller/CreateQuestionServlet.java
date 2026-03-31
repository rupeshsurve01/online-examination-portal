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

@WebServlet("/create-question")
public class CreateQuestionServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {

		HttpSession session = request.getSession(false);
		User user = session != null ? (User) session.getAttribute("user") : null;

		if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
			response.sendRedirect("login.jsp");
			return;
		}

		String examIdParam = request.getParameter("exam_id");
		String questionText = request.getParameter("question");
		String option1 = request.getParameter("option1");
		String option2 = request.getParameter("option2");
		String option3 = request.getParameter("option3");
		String option4 = request.getParameter("option4");
		String correctOptionParam = request.getParameter("correct_option");
		int examId;
		int correctOption;

		try {
			examId = Integer.parseInt(examIdParam);
			correctOption = Integer.parseInt(correctOptionParam);
		} catch (NumberFormatException e) {
			response.sendRedirect("edit-exam?examId=" + examIdParam + "&error=invalidInput");
			return;
		}

		if (questionText == null || questionText.trim().isEmpty()
				|| option1 == null || option1.trim().isEmpty()
				|| option2 == null || option2.trim().isEmpty()
				|| option3 == null || option3.trim().isEmpty()
				|| option4 == null || option4.trim().isEmpty()
				|| correctOption < 1 || correctOption > 4) {
			response.sendRedirect("edit-exam?examId=" + examId + "&error=invalidInput");
			return;
		}

		Question q = new Question();

		q.setExamId(examId);
		q.setQuestionText(questionText.trim());
		q.setOption1(option1.trim());
		q.setOption2(option2.trim());
		q.setOption3(option3.trim());
		q.setOption4(option4.trim());
		q.setCorrectOption(correctOption);

		QuestionDAO dao = new QuestionDAO();
		dao.createQuestion(q);

		response.sendRedirect("edit-exam?examId=" + examId + "&msg=questionAdded");
	}
}
