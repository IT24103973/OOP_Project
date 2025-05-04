package CourseManagemt.servlet;

import CourseManagemt.model.Course;
import CourseManagemt.utils.CourseFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseCode = request.getParameter("courseCode");
        String courseName = request.getParameter("courseName");
        String courseUnit = request.getParameter("courseUnit");
        int seatLimit = Integer.parseInt(request.getParameter("seatLimit"));
        String creationDate = LocalDate.now().toString();

        Course newCourse = new Course(courseCode, courseName, courseUnit, seatLimit, creationDate);

        CourseFileHandler.saveCourse(newCourse);

        response.sendRedirect("index.jsp");
    }
}
