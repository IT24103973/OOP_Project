package StudentProfile.servlet;

import StudentProfile.model.StudentProfile;
import StudentProfile.utils.StudentProfileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addStudentProfile")
public class AddStudentProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String department = request.getParameter("department");
        String emergency = request.getParameter("emergency");

        StudentProfile profile = new StudentProfile(studentId,
                phone != null ? phone.trim() : "",
                address != null ? address.trim() : "",
                department != null ? department.trim() : "",
                emergency != null ? emergency.trim() : ""
        );

        StudentProfileHandler.saveOrUpdateProfile(profile);
        response.sendRedirect("studentProfile.jsp");
    }
}
