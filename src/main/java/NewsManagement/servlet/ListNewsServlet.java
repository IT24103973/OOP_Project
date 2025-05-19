package NewsManagement.servlet;

import NewsManagement.utils.NewsFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/news")
public class ListNewsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setAttribute("newsList", NewsFileHandler.loadAll());
        req.getRequestDispatcher("news.jsp").forward(req, res);
    }
}

