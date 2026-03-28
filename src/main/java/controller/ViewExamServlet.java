package controller;

import java.io.IOException;
import java.util.List;

import dao.ExamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Exam;

@WebServlet("/view-exams")
public class ViewExamServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("category");
        ExamDAO dao = new ExamDAO();

        List<Exam> exams = dao.getAllExams(category);
        List<String> categories = dao.getAllCategories();

        System.out.println("Exam list size: " + exams.size());

        request.setAttribute("examList", exams);
        request.setAttribute("categoryList", categories);
        request.setAttribute("selectedCategory", category);

        request.getRequestDispatcher("view-exams.jsp").forward(request, response);
    }
}
