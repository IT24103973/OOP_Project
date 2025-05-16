package LoginAndLogout.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        String redirectTarget = "index.jsp"; // fallback

        if (session != null) {
            if (session.getAttribute("adminUser") != null) {
                redirectTarget = "adminLogin.jsp";
            } else if (session.getAttribute("studentUser") != null) {
                redirectTarget = "studentLogin.jsp";
            }

            session.invalidate(); // Invalidate after checking
        }

        response.sendRedirect(redirectTarget);
    }
}

