<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, CourseEnrollment.model.Enrollment, CourseEnrollment.utils.EnrollmentFileHandler" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session == null || session.getAttribute("adminUser") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    List<Enrollment> all = EnrollmentFileHandler.loadEnrollments();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Approved Enrollments - University of Education</title>
    <link rel="stylesheet" href="CSS/courseManagement.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<!-- Header -->
<div class="header">
    <div class="university-branding">
        <img src="pics/uni_logo.jpg" alt="University Logo" class="university-logo"/>
        <h1>University of Education</h1>
    </div>
    <div class="user-info">
        <div class="admin-welcome">
            Welcome, <%= session.getAttribute("adminUser") %>
        </div>
        <form action="logout" method="get">
            <button type="submit" class="btn btn-secondary logout-btn">
                Logout&nbsp;&nbsp;<i class="fa fa-sign-out"></i>
            </button>
        </form>
    </div>
</div>

<!-- Navigation -->
<div class="nav">
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="listCourses">Course Management</a>
    <a href="listStudents">Student Management</a>
    <a href="approvedEnrollments" class="active">Enrollment Management</a>
    <a href="addNews.jsp">Add News Updates</a>
</div>

<!-- Content -->
<div class="container">
    <div class="page-header">
        <h2>Approved Enrollments</h2>
    </div>

    <table>
        <thead>
        <tr>
            <th>#</th>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Email</th>
            <th>Course Code</th>
            <th>Reason</th>
            <th>Study Mode</th>
            <th>Approved Date and Time</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <%
            int i = 1;
            for (Enrollment e : all) {
                if ("approved".equalsIgnoreCase(e.getStatus())) {
        %>
        <tr>
            <td><%= i++ %></td>
            <td><%= e.getStudentId() %></td>
            <td><%= e.getStudentName() %></td>
            <td><%= e.getStudentEmail() %></td>
            <td><%= e.getCourseCode() %></td>
            <td><%= e.getEnrollmentReason() %></td>
            <td><%= e.getStudyMode() %></td>
            <td><%= e.getEnrollmentDate() %></td>
            <td>
                <form action="editCourse.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="StudentID">
                    <button type="submit" class="btn btn-edit">Edit</button>
                </form>

                <form action="deleteStudent" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this course?');">
                    <input type="hidden" name="StudentID">
                    <button type="submit" class="btn btn-delete">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>

<!-- Footer -->
<div class="footer">
    <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
    <p>© 2025 University of Education. All rights reserved.</p>
</div>
</body>
</html>
