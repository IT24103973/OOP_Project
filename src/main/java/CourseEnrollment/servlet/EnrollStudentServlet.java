package CourseEnrollment.servlet;

import CourseEnrollment.model.Enrollment;
import CourseEnrollment.utils.EnrollmentFileHandler;
import CourseManagement.model.Course;
import CourseManagement.utils.CourseFileHandler;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/enrollStudent")
public class EnrollStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String studentId = request.getParameter("studentId");
        String studentName = request.getParameter("studentName");
        String studentEmail = request.getParameter("studentEmail");
        String courseCode = request.getParameter("courseCode");
        String reason = request.getParameter("enrollmentReason");
        String status = request.getParameter("status");

        Course selectedCourse = CourseFileHandler.getCourseByCode(courseCode);

        if (selectedCourse == null) {
            request.setAttribute("errorMessage", "Selected course does not exist!");
            request.getRequestDispatcher("addEnrollment.jsp").forward(request, response);
            return;
        }

        String mode = selectedCourse.getCourseType();

        String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("MM/dd/yyyy hh:mm a"));

        // Check for duplicate enrollment
        if (EnrollmentFileHandler.isAlreadyEnrolled(studentId, courseCode)) {
            request.setAttribute("errorMessage", "You are already enrolled in this course!");
            request.getRequestDispatcher("addEnrollment.jsp").forward(request, response);
            return;
        }

        Enrollment enrollment = new Enrollment(studentId, studentName, studentEmail, courseCode, reason, mode, date, status);
        EnrollmentFileHandler.saveEnrollment(enrollment);

        response.sendRedirect("courseEnrollment.jsp");
    }
}
