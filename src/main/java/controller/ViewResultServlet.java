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

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        int studentId = user.getId();

        ResultDAO dao = new ResultDAO();

        List<Result> results = dao.getResultsByStudent(studentId);

        request.setAttribute("resultList", results);

        request.getRequestDispatcher("results.jsp").forward(request,response);
    }
}
