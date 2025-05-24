package EnrollmentManagement.servlet;

import CourseEnrollment.model.Enrollment;
import CourseEnrollment.utils.EnrollmentFileHandler;
import EnrollmentManagement.utils.EnrollmentQueue;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/pendingEnrollments")
public class PendingEnrollmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EnrollmentQueue queue = EnrollmentFileHandler.loadPendingEnrollmentsToQueue();

        request.setAttribute("pending", queue.toArray());
        RequestDispatcher dispatcher = request.getRequestDispatcher("pendingEnrollments.jsp");
        dispatcher.forward(request, response);
    }
}

