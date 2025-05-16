package CourseManagement.servlet;
import java.util.List;
import CourseManagement.model.Profile;
import CourseManagement.utils.ProfileFileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;


@WebServlet("/displayProfiles")
public class DisplayProfilesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Profile> profiles = ProfileFileHandler.loadProfiles();
        request.setAttribute("profiles", profiles);
        request.getRequestDispatcher("/displayProfiles.jsp").forward(request, response);
    }
}

