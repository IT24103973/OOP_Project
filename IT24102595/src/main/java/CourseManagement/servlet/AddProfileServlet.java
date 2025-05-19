package CourseManagement.servlet;

import CourseManagement.model.Profile;
import CourseManagement.utils.ProfileFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/addProfile")
public class AddProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String name = request.getParameter("studentName");
        String id = request.getParameter("studentID");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String bio = request.getParameter("bio");

        // Create and save new profile
        Profile profile = new Profile(name, id, email, course, bio);
        ProfileFileHandler.saveProfile(profile);

        // Load all profiles to display
        List<Profile> profiles = ProfileFileHandler.loadProfiles();

        // Add profiles to request scope
        request.setAttribute("profiles", profiles);

        // Forward to JSP (not redirect, so request attributes stay)
        RequestDispatcher dispatcher = request.getRequestDispatcher("Profile.jsp");
        dispatcher.forward(request, response);
    }
}
