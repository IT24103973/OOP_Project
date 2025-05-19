package NewsManagement.servlet;

import NewsManagement.model.News;
import NewsManagement.utils.NewsFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/addNews")
public class AddNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String title = req.getParameter("title");
        String body  = req.getParameter("body");

        if (title != null && body != null && !title.isBlank() && !body.isBlank()) {
            NewsFileHandler.save(new News(title.trim(), body.trim()));
        }
        res.sendRedirect("addNews.jsp?saved=1");
    }
}
