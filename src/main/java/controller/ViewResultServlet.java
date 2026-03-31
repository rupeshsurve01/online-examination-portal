package controller;

import java.io.IOException;
import java.util.List;

import dao.ResultDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Result;
import model.User;

@WebServlet("/view-results")
public class ViewResultServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int studentId = user.getId();

        ResultDAO dao = new ResultDAO();

        boolean isAdmin = "admin".equalsIgnoreCase(user.getRole());
        List<Result> results = isAdmin ? dao.getAllResults() : dao.getResultsByStudent(studentId);
        int examCount = isAdmin ? results.size() : dao.getAttemptedExamCount(studentId);
        double averageScore = isAdmin ? dao.getAverageScoreAcrossAllStudents() : dao.getAverageScore(studentId);
        String bestCategory = isAdmin ? dao.getBestCategoryAcrossAllStudents() : dao.getBestCategory(studentId);

        request.setAttribute("resultList", results);
        request.setAttribute("examCount", examCount);
        request.setAttribute("averageScore", averageScore);
        request.setAttribute("bestCategory", bestCategory);
        request.setAttribute("pageTitle", isAdmin ? "All Results" : "Your Results");
        request.setAttribute("backLink", isAdmin ? "admin-dashboard.jsp" : "student-dashboard.jsp");
        request.setAttribute("backLabel", isAdmin ? "Back to Admin Dashboard" : "Back to Dashboard");

        request.getRequestDispatcher("results.jsp").forward(request,response);
    }
}
