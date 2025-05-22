package FeedbackManagement.servlet;

import FeedbackManagement.model.Feedback;
import FeedbackManagement.utils.FeedbackFileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/addFeedback")
public class AddFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        String student = (String) session.getAttribute("studentUser");
        String message = req.getParameter("message");

        if (student != null && message != null && !message.trim().isEmpty()) {
            FeedbackFileHandler.save(new Feedback(student, message.trim()));
        }

        res.sendRedirect("addFeedback.jsp?saved=1");
    }
}
