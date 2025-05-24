package EnrollmentManagement.servlet;

import CourseEnrollment.model.Enrollment;
import CourseEnrollment.utils.EnrollmentFileHandler;
import EnrollmentManagement.utils.EnrollmentQueue;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/approveEnrollment")
public class ApproveEnrollmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sid = request.getParameter("sid");
        String code = request.getParameter("code");

        EnrollmentQueue updatedQueue = new EnrollmentQueue();
        EnrollmentQueue originalQueue = EnrollmentFileHandler.loadAllEnrollmentsToQueue();

        while (!originalQueue.isEmpty()) {
            Enrollment e = originalQueue.dequeue();
            if (e.getStudentId().equals(sid) && e.getCourseCode().equals(code)
                    && "pending".equalsIgnoreCase(e.getStatus())) {
                // Update status
                updatedQueue.enqueue(new Enrollment(
                        e.getStudentId(), e.getStudentName(), e.getStudentEmail(),
                        e.getCourseCode(), e.getEnrollmentReason(), e.getStudyMode(),
                        e.getEnrollmentDate(), "approved"
                ));
            } else {
                updatedQueue.enqueue(e);
            }
        }

        EnrollmentFileHandler.overwriteEnrollments(updatedQueue.toArray());
        response.sendRedirect("pendingEnrollments");
    }
}

