package Login.servlet;

import Login.utils.LoginFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("adminUsername");
        String password = request.getParameter("adminPassword");

        if (LoginFileHandler.validateAdmin(username, password)) {
            request.getSession().setAttribute("adminUser", username);
            response.sendRedirect("adminDashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid admin credentials");
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
        }
    }
}

