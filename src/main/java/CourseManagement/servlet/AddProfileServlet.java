package CourseManagement.servlet;

import CourseManagement.model.Profile;
import CourseManagement.utils.ProfileFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addProfile")
public class AddProfileServlet extends HttpServlet {




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("studentName");
        String id = request.getParameter("studentID");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String bio = request.getParameter("bio");

        Profile profile = new Profile(name, id, email, course, bio);
        ProfileFileHandler.saveProfile(profile);

        response.sendRedirect("profiles.jsp");
    }

}
