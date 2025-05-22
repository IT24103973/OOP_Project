<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="StudentManagement.model.Student, StudentManagement.utils.StudentFileHandler" %>
<%@ page import="StudentProfile.model.StudentProfile, StudentProfile.utils.StudentProfileHandler" %>
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
    StudentProfile profile = StudentProfileHandler.getProfileById(studentId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Profile - University of Education</title>
    <link rel="stylesheet" href="CSS/courseManagement.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .profile-section {
            background-color: #fff;
            padding: 25px;
            border-radius: 6px;
            margin-top: 30px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .profile-section h3 {
            margin-top: 0;
            color: #003366;
            margin-bottom: 15px;
        }

        .profile-detail {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .profile-detail label {
            font-weight: bold;
            color: #004080;
            margin-right: 5px;
        }

        .btn-profile {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            display: inline-block;
        }

        .btn-profile:hover {
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
        <div class="admin-welcome">Welcome, <%= student.getStudentId() %></div>
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
    <a href="courseEnrollment.jsp">My Enrollments</a>
    <a href="studentProfile.jsp" class="active">Student Profile</a>
    <a href="news">News</a>
    <a href="addFeedback.jsp">Add Feedback</a>
</div>

<div class="container">
    <div class="page-header">
        <h2>Student Profile</h2>
    </div>

    <div class="profile-section">
        <h3>Basic Information</h3>
        <div class="profile-detail"><label>Student ID:</label> <%= student.getStudentId() %></div>
        <div class="profile-detail"><label>Name:</label> <%= student.getStudentName() %></div>
        <div class="profile-detail"><label>Email:</label> <%= student.getStudentEmail() %></div>
    </div>

    <div class="profile-section">
        <h3>Additional Details</h3>
        <div class="profile-detail"><label>Phone:</label> <%= (profile != null && profile.getPhone() != null ? profile.getPhone() : "Not Provided") %></div>
        <div class="profile-detail"><label>Address:</label> <%= (profile != null && profile.getAddress() != null ? profile.getAddress() : "Not Provided") %></div>
        <div class="profile-detail"><label>Department:</label> <%= (profile != null && profile.getDepartment() != null ? profile.getDepartment() : "Not Provided") %></div>
        <div class="profile-detail"><label>Emergency Contact:</label> <%= (profile != null && profile.getEmergency() != null ? profile.getEmergency() : "Not Provided") %></div>
    </div>

    <a href="addProfileDetails.jsp" class="btn-profile">Add / Update Profile Details</a>
</div>

<div class="footer">
    <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
    <p>© 2025 University of Education. All rights reserved.</p>
</div>

</body>
</html>
