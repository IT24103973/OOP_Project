package FeedbackManagement.servlet;

import FeedbackManagement.utils.FeedbackFileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/listFeedback")
public class ListFeedbackServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setAttribute("feedbackList", FeedbackFileHandler.loadAll());
        req.getRequestDispatcher("adminViewFeedback.jsp").forward(req, res);
    }
}

