package LoginAndLogout.servlet;

import LoginAndLogout.utils.LoginFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/studentLogin")
public class StudentLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("studentId");
        String password = request.getParameter("password");

        if (LoginFileHandler.validateStudent(username, password)) {
            request.getSession().setAttribute("studentUser", username);
            response.sendRedirect("studentDashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid student credentials");
            request.getRequestDispatcher("studentLogin.jsp").forward(request, response);
        }
    }
}

