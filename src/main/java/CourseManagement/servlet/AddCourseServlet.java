package CourseManagement.servlet;

import CourseManagement.model.Course;
import CourseManagement.model.OnCampusCourse;
import CourseManagement.model.OnlineCourse;
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
        String type = request.getParameter("courseType");

        if (seatLimit <= 0 || courseDuration <= 0 || !courseCode.matches("[A-Z]{2}\\d{3}")) {
            request.setAttribute("error", "Invalid course data.");
            RequestDispatcher dispatcher1 = request.getRequestDispatcher("addCourse.jsp");
            dispatcher1.forward(request, response);
            return;
        }

        if (CourseFileHandler.isCourseExists(courseCode)) {
            request.setAttribute("error1", "Course with this code already exists!");
            RequestDispatcher dispatcher2 = request.getRequestDispatcher("addCourse.jsp");
            dispatcher2.forward(request, response);
            return;
        }

        Course newCourse;
        if ("Online".equalsIgnoreCase(type)) {
            newCourse = new OnlineCourse(courseCode, courseName, courseUnit, seatLimit, courseDuration, creationDate);
        } else {
            newCourse = new OnCampusCourse(courseCode, courseName, courseUnit, seatLimit, courseDuration, creationDate);
        }

        CourseFileHandler.saveCourse(newCourse);

        response.sendRedirect("addCourse.jsp?saved=1");

    }
}