package CourseManagement.servlet;

import CourseManagement.utils.CourseFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteCourse")
public class DeleteCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseCode = request.getParameter("courseCode");

        // Calls the method to delete the course from courseFileHandler
        CourseFileHandler.deleteCourse(courseCode);

        // Sent back to course list
        response.sendRedirect("listCourses");
    }
}

