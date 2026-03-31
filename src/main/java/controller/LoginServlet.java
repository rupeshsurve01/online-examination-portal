package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({"/LoginServlet", "/login"})
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email != null) {
            email = email.trim();
        }

        if (password != null) {
            password = password.trim();
        }

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=empty");
            return;
        }

        UserDAO dao = new UserDAO();
        User user = dao.login(email, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            String role = user.getRole() != null ? user.getRole().trim() : "";

            if ("admin".equalsIgnoreCase(role)) {
                response.sendRedirect("admin-dashboard.jsp");
            } else {
                response.sendRedirect("student-dashboard.jsp");
            }

        } else {
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}
