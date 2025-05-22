<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="CourseEnrollment.model.Enrollment" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session == null || session.getAttribute("adminUser") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pending Enrollments - University of Education</title>
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
    <a href="pendingEnrollments" class="active">Enrollment Management</a>
    <a href="addNews.jsp">Add News Updates</a>
    <a href="listFeedback">Student Feedbacks</a>
</div>

<!-- Content -->
<div class="container">
    <div class="page-header">
        <h2>Pending Enrollment Requests</h2>
        <button class="btn btn-secondary" onclick="location.href='approvedEnrollments.jsp'">View Approved Requests</button>
    </div>

    <table>
        <thead>
        <tr>
            <th>Student ID</th>
            <th>Course Code</th>
            <th>Reason</th>
            <th>Requested Date</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <%
            Enrollment[] pending = (Enrollment[]) request.getAttribute("pending");
            if (pending == null || pending.length == 0) {
        %>
        <tr>
            <td colspan="5">No pending enrollments found.</td>
        </tr>
        <%
        } else {
            for (Enrollment e : pending) {
        %>
        <tr>
            <td><%= e.getStudentId() %></td>
            <td><%= e.getCourseCode() %></td>
            <td><%= e.getEnrollmentReason() %></td>
            <td><%= e.getEnrollmentDate() %></td>
            <td>
                <form action="approveEnrollment" method="post" style="display:inline;">
                    <input type="hidden" name="sid" value="<%= e.getStudentId() %>"/>
                    <input type="hidden" name="code" value="<%= e.getCourseCode() %>"/>
                    <button type="submit" class="btn btn-primary">Approve</button>
                </form>

                <form action="rejectEnrollment" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to reject this enrollment?');">
                    <input type="hidden" name="sid" value="<%= e.getStudentId() %>"/>
                    <input type="hidden" name="code" value="<%= e.getCourseCode() %>"/>
                    <button type="submit" class="btn btn-secondary">Reject</button>
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
