<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session == null || session.getAttribute("studentUser") == null) {
        response.sendRedirect("studentLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Dashboard - University of Education</title>
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
            Welcome, <%= session.getAttribute("studentUser") %>
        </div>

        <form action="logout" method="get">
            <button type="submit" class="btn btn-secondary logout-btn">
                Logout&nbsp;&nbsp;<i class="fa fa-sign-out"></i>
            </button>
        </form>
    </div>
</div>

<div class="nav">
    <a href="studentDashboard.jsp" class="active">Dashboard</a>
    <a href="addEnrollment.jsp">Course Enrollment</a>
    <a href="courseEnrollment.jsp">My Enrollments</a>
    <a href="studentProfile.jsp">Student Profile</a>
    <a href="news">News</a>
    <a href="addFeedback.jsp">Add Feedback</a>
</div>

<div class="container">
    <div class="page-header">
        <h2>Student Dashboard</h2>
    </div>

    <div class="dashboard-cards">
        <div class="dashboard-card" onclick="location.href='courseEnrollment.jsp'">
            <h3>Course Enrollment</h3>
            <p>Enroll in courses offered at the university.</p>
        </div>

        <div class="dashboard-card" onclick="location.href='studentProfile.jsp'">
            <h3>Student Profile</h3>
            <p>View your details on Student Profile.</p>
        </div>

        <div class="dashboard-card" onclick="location.href='news'">
            <h3>News</h3>
            <p>Review important updates regarding the University.</p>
        </div>

        <div class="dashboard-card" onclick="location.href='addFeedback.jsp'">
            <h3>Add Feedback</h3>
            <p>Add your thoughts about the system and the university.</p>
        </div>
    </div>
</div>

<div class="footer">
    <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
    <p>© 2025 University of Education. All rights reserved.</p>
</div>
</body>
</html>
