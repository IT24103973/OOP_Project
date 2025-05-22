package CourseManagement.servlet;

import CourseManagement.model.Profile;
import CourseManagement.utils.ProfileFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("studentName");
        String id = request.getParameter("studentID");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String bio = request.getParameter("bio");

        Profile updated = new Profile(name, id, email, course, bio);
        ProfileFileHandler.updateProfile(updated);

        response.sendRedirect("profiles.jsp"); // optional
    }
}
