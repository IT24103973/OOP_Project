package StudentManagement.servlet;

import CourseManagement.utils.CourseFileHandler;
import StudentManagement.model.Student;
import StudentManagement.utils.StudentFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

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

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String addedDate = LocalDateTime.now().format(formatter);

        if (StudentFileHandler.isStudentExists(studentId)) {
            request.setAttribute("error", "Student with this ID already exists!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("addStudent.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (StudentFileHandler.isStudentEmailExists(studentEmail)) {
            request.setAttribute("error1", "Student with this Email already exists!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("addStudent.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Student student = new Student(studentId, studentPassword, studentName, studentEmail, addedDate);
        StudentFileHandler.saveStudent(student);

        response.sendRedirect("addStudent.jsp");
    }
}
