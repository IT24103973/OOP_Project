<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% //session validation
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session == null || session.getAttribute("adminUser") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<%@ page import="java.util.*, CourseManagement.model.Course" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management - University of Education</title>
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
    <a href="listCourses" class="active">Course Management</a>
    <a href="listStudents">Student Management</a>
    <a href="pendingEnrollments">Enrollment Management</a>
    <a href="addNews.jsp">Add News Updates</a>
    <a href="listFeedback">Student Feedbacks</a>
</div>

<div class="container">
    <div class="page-header">
        <h2>Course Management</h2>
        <button class="btn btn-primary" onclick="location.href='addCourse.jsp'">Add new Course</button>
    </div>

    <table>
        <thead>
        <tr>
            <th>#</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <th>Course Unit</th>
            <th>Seat Limit</th>
            <th>Duration (Years)</th>
            <th>Type</th>
            <th>Creation Date</th>
            <th>Action</th>
        </tr>
        </thead>

        <%
            List<Course> courseList = (List<Course>) request.getAttribute("courses");
            int i = 1;
            if (courseList != null) {
                for (Course c : courseList) {
        %>
        <tr>
            <td><%= i++ %></td>
            <td><%= c.getCourseCode() %></td>
            <td><%= c.getCourseName() %></td>
            <td><%= c.getCourseUnit() %></td>
            <td><%= c.getSeatLimit() %></td>
            <td><%= c.getCourseDuration() %></td>
            <td><%= c.getCourseType() %></td>
            <td><%= c.getCreationDate() %></td>
            <td>
                <form action="editCourse.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="courseCode" value="<%= c.getCourseCode() %>"/>
                    <button type="submit" class="btn btn-edit">Edit</button>
                </form>

                <form action="deleteCourse" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this course?');">
                    <input type="hidden" name="courseCode" value="<%= c.getCourseCode() %>"/>
                    <button type="submit" class="btn btn-delete">Delete</button>
                </form>
            </td>

        </tr>
        <%
                }
            }
        %>
    </table>
</div>

<div class="footer">
    <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
    <p>© 2025 University of Education. All rights reserved.</p>
</div>
</body>
</html>