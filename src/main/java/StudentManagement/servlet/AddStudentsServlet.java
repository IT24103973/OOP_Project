package StudentManagement.servlet;

import StudentManagement.model.Student;
import StudentManagement.utils.StudentFileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/addStudent")
public class AddStudentsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        String studentPassword = request.getParameter("studentPassword");
        String studentName = request.getParameter("studentName");
        String studentEmail = request.getParameter("studentEmail");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy hh:mm:ss a");
        String addedDate = LocalDateTime.now().format(formatter);

        Student student = new Student(studentId, studentPassword, studentName, studentEmail, addedDate);
        StudentFileHandler.saveStudent(student);

        response.sendRedirect("addStudent.jsp");
    }
}
