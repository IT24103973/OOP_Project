<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="CourseManagement.model.Profile" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile Management - University of Education</title>
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
    <a href="listCourses">Course Management</a>
    <a href="listStudents">Student Management</a>
    <a href="listEnrollments">Enrollment Management</a>
    <a href="listProfiles" class="active">Profile Management</a>
</div>

<div class="container">
    <div class="page-header">
        <h2>Profile Management</h2>
        <button class="btn btn-primary" onclick="location.href='addProfile.jsp'">Add New Profile</button>
    </div>

    <table>
        <thead>
        <tr>
            <th>#</th>
            <th>Student ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Contact Number</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Profile> profileList = (List<Profile>) request.getAttribute("profiles");
            int i = 1;
            if (profileList != null) {
                for (Profile p : profileList) {
        %>
        <tr>
            <td><%= i++ %></td>
            <td><%= p.getStudentId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getEmail() %></td>
            <td><%= p.getContactNumber() %></td>
            <td>
                <form action="editProfile.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="studentId" value="<%= p.getStudentId() %>"/>
                    <button type="submit" class="btn btn-edit">Edit</button>
                </form>

                <form action="deleteProfile" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this profile?');">
                    <input type="hidden" name="studentId" value="<%= p.getStudentId() %>"/>
                    <button type="submit" class="btn btn-delete">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No profiles found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<div class="footer">
    <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
    <p>© 2025 University of Education. All rights reserved.</p>
</div>
</body>
</html>
