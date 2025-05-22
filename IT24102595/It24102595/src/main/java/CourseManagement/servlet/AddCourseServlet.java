package CourseManagement.servlet;

import CourseManagement.model.Course;
import CourseManagement.utils.CourseFileHandler;
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
        int courseDuration = Integer.parseInt(request.getParameter("courseDuration"));
        String creationDate = LocalDate.now().toString();

        if (CourseFileHandler.isCourseExists(courseCode)) {
            request.setAttribute("error", "Course with this code already exists!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("addCourse.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Course newCourse = new Course(courseCode, courseName, courseUnit, seatLimit, courseDuration, creationDate);

        CourseFileHandler.saveCourse(newCourse);

        response.sendRedirect("addCourse.jsp");
    }
}