<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, NewsManagement.model.News" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session == null || session.getAttribute("studentUser") == null) {
        response.sendRedirect("studentLogin.jsp");
        return;
    }

    List<News> newsList = (List<News>) request.getAttribute("newsList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>University News - University of Education</title>
    <link rel="stylesheet" href="CSS/courseManagement.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .news-item { background:#fff;padding:20px;border-radius:6px;box-shadow:0 2px 4px rgba(0,0,0,0.1);margin-bottom:25px; }
        .news-item h3 { margin:0 0 10px;color:#003366; }
    </style>
</head>
<body>

<!-- Header -->
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

<!-- Navigation -->
<div class="nav">
    <a href="studentDashboard.jsp">Dashboard</a>
    <a href="addEnrollment.jsp">Course Enrollment</a>
    <a href="courseEnrollment.jsp">My Enrollments</a>
    <a href="studentProfile.jsp">Student Profile</a>
    <a href="news" class="active">News</a>
</div>

<!-- Content -->
<div class="container">
    <div class="page-header">
        <h2>University News</h2>
    </div>

    <%
        if (newsList == null || newsList.isEmpty()) {
    %>
    <p>No news available at the moment.</p>
    <%
    } else {
        for (News n : newsList) {
    %>
    <div class="news-item">
        <h3><%= n.getTitle() %></h3>
        <p><%= n.getBody() %></p>
    </div>
    <%
            }
        }
    %>
</div>

<!-- Footer -->
<div class="footer">
    <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
    <p>© 2025 University of Education. All rights reserved.</p>
</div>
</body>
</html>
