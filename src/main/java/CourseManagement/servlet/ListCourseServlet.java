package CourseManagement.servlet;

import CourseManagement.model.Course;
import CourseManagement.utils.CourseFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/listCourses")
public class ListCourseServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Course> courses = CourseFileHandler.loadCourses();
        request.setAttribute("courses", courses);
        RequestDispatcher messenger = request.getRequestDispatcher("courses.jsp");
        messenger.forward(request, response);
    }
}
