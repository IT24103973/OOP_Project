package CourseEnrollment.servlet;

import CourseEnrollment.model.Enrollment;
import CourseEnrollment.utils.EnrollmentFileHandler;
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
        String mode = request.getParameter("studyMode");

        String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("MM/dd/yyyy hh:mm a"));
        String status = request.getParameter("status");

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
