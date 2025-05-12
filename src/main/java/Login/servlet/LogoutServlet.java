package Login.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false); // Don’t create if it doesn’t exist
        if (session != null) {
            session.invalidate(); // Destroys session
        }
        response.sendRedirect("adminLogin.jsp");
    }
}
