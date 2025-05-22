<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Add News - University of Education</title>
    <link rel="stylesheet" href="CSS/courseManagement.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .view-link-btn {
            position: absolute;
            right: 20px;
            bottom: 80px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #007bff;
            padding: 10px 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }

        .view-link-btn:hover {
            background-color: #0056b3;
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
            Welcome, <%= session.getAttribute("adminUser") %>
        </div>
        <form action="logout" method="get">
            <button type="submit" class="btn btn-secondary logout-btn">
                Logout&nbsp;&nbsp;<i class="fa fa-sign-out"></i>
            </button>
        </form>
    </div>
</div>

<div class="nav">
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="listCourses">Course Management</a>
    <a href="listStudents">Student Management</a>
    <a href="pendingEnrollments">Enrollment Management</a>
    <a href="addNews.jsp" class="active">Add News Updates</a>
    <a href="listFeedback">Student Feedbacks</a>
</div>

<div class="container">
    <div class="page-header">
        <h2>Add University News</h2>
    </div>

    <% if ("1".equals(request.getParameter("saved"))) { %>
    <p style="color: green;">News posted successfully!</p>
    <% } %>

    <form action="addNews" method="post" class="student-form">
        <div class="form-group">
            <label for="title">News Title</label>
            <input type="text" name="title" id="title" placeholder="Enter title..." required>
        </div>

        <div class="form-group">
            <label for="body">News Content</label>
            <textarea name="body" id="body" placeholder="Enter news content..." rows="6" required></textarea>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn btn-primary">Publish News</button>
            <button type="button" class="btn btn-secondary" onclick="location.href='adminDashboard.jsp'">Cancel</button>
        </div>
    </form>

    <form action="adminViewNews.jsp" method="get">
        <button type="submit" class="view-link-btn">View Added News</button>
    </form>
</div>

<div class="footer">
    <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
    <p>© 2025 University of Education. All rights reserved.</p>
</div>
</body>
</html>
