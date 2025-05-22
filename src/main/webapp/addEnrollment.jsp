<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, StudentManagement.model.Student, StudentManagement.utils.StudentFileHandler, CourseManagement.model.Course, CourseManagement.utils.CourseFileHandler" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session == null || session.getAttribute("studentUser") == null) {
        response.sendRedirect("studentLogin.jsp");
        return;
    }

    String studentId = (String) session.getAttribute("studentUser");
    Student student = StudentFileHandler.getStudentById(studentId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Course Enrollment - University of Education</title>
    <link rel="stylesheet" href="CSS/courseManagement.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .student-info-box {
            background-color: #fff;
            padding: 20px;
            border-radius: 6px;
            margin-bottom: 30px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .student-info-box h3 {
            margin-top: 0;
            color: #003366;
            margin-bottom: 15px;
        }

        .student-info {
            display: flex;
            flex-direction: column;
            gap: 10px;
            font-size: 16px;
        }

        .student-info label {
            font-weight: bold;
            color: #004080;
        }

        .footer {
            background-color: #003366;
            color: white;
            padding: 15px 20px;
            text-align: center;
            font-size: 14px;
            margin-top: 40px;
        }

        .footer p {
            margin: 5px 0;
        }
    </style>
</head>
<body>

<div class="header">
    <div class="university-branding">
        <img src="pics/uni_logo.jpg" alt="University Logo" class="university-logo" />
        <h1>University of Education</h1>
    </div>
    <div class="user-info">
        <div class="admin-welcome">
            Welcome, <%= studentId %>
        </div>
        <form action="logout" method="get">
            <button type="submit" class="btn btn-secondary logout-btn">
                Logout&nbsp;&nbsp;<i class="fa fa-sign-out"></i>
            </button>
        </form>
    </div>
</div>

<div class="nav">
    <a href="studentDashboard.jsp">Dashboard</a>
    <a href="#" class="active">Course Enrollment</a>
    <a href="courseEnrollment.jsp">My Enrollments</a>
    <a href="studentProfile.jsp">Student Profile</a>
    <a href="news">News</a>
    <a href="addFeedback.jsp">Add Feedback</a>
</div>

<div class="container">
    <div class="page-header">
        <h2>Course Enrollment</h2>
    </div>

    <div class="student-info-box">
        <h3>Your Details</h3>
        <div class="student-info">
            <div><label>Student ID:</label> <%= student.getStudentId() %></div>
            <div><label>Name:</label> <%= student.getStudentName() %></div>
            <div><label>Email:</label> <%= student.getStudentEmail() %></div>
        </div>
    </div>

    <form class="student-form" action="enrollStudent" method="post">
        <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">
        <input type="hidden" name="studentName" value="<%= student.getStudentName() %>">
        <input type="hidden" name="studentEmail" value="<%= student.getStudentEmail() %>">
        <input type ="hidden" name="status" value="pending">

        <div class="form-group">
            <label for="courseSelect">Available Courses:</label>
            <select name="courseCode" id="courseSelect" required>
                <%
                    List<Course> courses = CourseFileHandler.loadCourses();
                    if (courses != null && !courses.isEmpty()) {
                        for (Course course : courses) {
                %>
                <option value="<%= course.getCourseCode() %>">
                    <%= course.getCourseCode() %> - <%= course.getCourseName() %>
                </option>
                <%
                    }
                } else {
                %>
                <option disabled>No courses available</option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <label for="reason">Reason for Enrollment</label>
            <textarea id="reason" name="enrollmentReason" rows="4" placeholder="Explain briefly..." required></textarea>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn btn-enroll">Enroll</button>
            <button type="reset" class="btn btn-reset">Clear</button>
        </div>

        <%
            String error = (String) request.getAttribute("errorMessage");
            if (error != null) {
        %>
        <div style="color: red; font-weight: bold; padding: 10px 0;"><%= error %></div>
        <%
            }
        %>
    </form>
</div>

<div class="footer">
    <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
    <p>© 2025 University of Education. All rights reserved.</p>
</div>

</body>
</html>
