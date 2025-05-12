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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course - University of Education</title>
    <link rel="stylesheet" href="CSS/courseManagement.css">
</head>
<body>
<div class="header">
    <div class="university-branding">
        <img src="pics/uni_logo.jpg" alt="University Logo" class="university-logo" />
        <h1>University of Education</h1>
    </div>
    <div class="user-info">
        <div class="admin-welcome">Welcome, Admin</div>
        <form action="logout" method="get">
            <button type="submit" class="btn btn-secondary logout-btn">Logout</button>
        </form>
    </div>
</div>

<div class="nav">
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="listCourses" class="active">Course Management</a>
    <a href="listStudents">Student Management</a>
    <a href="listEnrollments">Enrollment Management</a>
</div>

<div class="container">
    <div class="page-header">
        <h2>Add a Course</h2>
        <button class="btn btn-secondary" onclick="location.href='listCourses'">Back to List</button>
    </div>

    <form action = addCourse method = post class="student-form">
        <div class="form-group">
            <label for="courseCode">Course Code</label>
            <input type="text" id="courseCode" name="courseCode" required>
        </div>

        <div class="form-group">
            <label for="courseName">Course Name</label>
            <input type="text" id="courseName" name="courseName" required>
        </div>

        <div class="form-group">
            <label for="courseUnit">Course Unit</label>
            <input type="text" id="courseUnit" name="courseUnit" required>
        </div>

        <div class="form-group">
            <label for="seatLimit">Seat Limit</label>
            <input type="number" id="seatLimit" name="seatLimit" required>
        </div>

        <div class="form-group">
            <label for="courseDuration">Course Duration (Years)</label>
            <select id="courseDuration" name="courseDuration" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn btn-primary">Add Course</button>
            <button type="button" class="btn btn-secondary" onclick="location.href='listCourses'">Cancel</button>
        </div>
    </form>
</div>

<div class="footer">
    <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
    <p>© 2025 University of Education. All rights reserved.</p>
</div>
</body>
</html>