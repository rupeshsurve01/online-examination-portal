package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.login(email, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if(user.getRole().equals("admin")){
                response.sendRedirect("admin-dashboard.jsp");
                System.out.println("Directing to Admin Dashboard");
            } else {
                response.sendRedirect("student-dashboard.jsp");
                System.out.println("Directing to Student Dashboard");
            }

        } else {
            response.sendRedirect("login.jsp?error=invalid");
            System.out.println("Error");
        }
    }
}