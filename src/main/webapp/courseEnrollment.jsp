<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, CourseEnrollment.model.Enrollment, CourseEnrollment.utils.EnrollmentFileHandler" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session == null || session.getAttribute("studentUser") == null) {
        response.sendRedirect("studentLogin.jsp");
        return;
    }

    List<Enrollment> allEnrollments = EnrollmentFileHandler.loadEnrollments();
    String studentId = (String) session.getAttribute("studentUser");

    List<Enrollment> pending = new ArrayList<>();
    List<Enrollment> approved = new ArrayList<>();

    for (Enrollment e : allEnrollments) {
        if (e.getStudentId().equals(studentId)) {
            if ("Approved".equalsIgnoreCase(e.getStatus())) {
                approved.add(e);
            } else {
                pending.add(e);
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Enrollments</title>
    <link rel="stylesheet" href="CSS/courseManagement.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
    <a href="addEnrollment.jsp">Course Enrollment</a>
    <a href="courseEnrollment.jsp" class="active">My Enrollments</a>
    <a href="studentProfile.jsp">Student Profile</a>
    <a href="news">News</a>
</div>

<div class="container">
    <div class="page-header">
        <h2>Your Course Enrollments</h2>
        <button class="btn btn-primary" onclick="location.href='addEnrollment.jsp'"><i class="fa fa-plus"></i>&nbsp;&nbsp;Add New Enrollment</button>
    </div>

    <h3>Pending Enrollments</h3>
    <table>
        <tr>
            <th>Course Code</th>
            <th>Reason</th>
            <th>Study Mode</th>
            <th>Submitted On</th>
        </tr>
        <%
            if (pending.isEmpty()) {
        %>
        <tr><td colspan="4">No pending enrollments.</td></tr>
        <%
        } else {
            for (Enrollment e : pending) {
        %>
        <tr>
            <td><%= e.getCourseCode() %></td>
            <td><%= e.getEnrollmentReason() %></td>
            <td><%= e.getStudyMode() %></td>
            <td><%= e.getEnrollmentDate() %></td>
        </tr>
        <% }} %>
    </table>

    <h3 style="margin-top: 40px;">Approved Enrollments</h3>
    <table>
        <tr>
            <th>Course Code</th>
            <th>Reason</th>
            <th>Study Mode</th>
            <th>Approved On</th>
        </tr>
        <%
            if (approved.isEmpty()) {
        %>
        <tr><td colspan="4">No approved enrollments.</td></tr>
        <%
        } else {
            for (Enrollment e : approved) {
        %>
        <tr>
            <td><%= e.getCourseCode() %></td>
            <td><%= e.getEnrollmentReason() %></td>
            <td><%= e.getStudyMode() %></td>
            <td><%= e.getEnrollmentDate() %></td>
        </tr>
        <% }} %>
    </table>
</div>

<div class="footer">
    <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
    <p>© 2025 University of Education. All rights reserved.</p>
</div>

</body>
</html>
