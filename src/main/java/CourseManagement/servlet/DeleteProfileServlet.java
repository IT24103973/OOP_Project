package CourseManagement.servlet;

import CourseManagement.utils.ProfileFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteProfile")
public class DeleteProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentID = request.getParameter("studentID");
        ProfileFileHandler.deleteProfile(studentID);

        response.sendRedirect("Profile"); // optional
    }
}
