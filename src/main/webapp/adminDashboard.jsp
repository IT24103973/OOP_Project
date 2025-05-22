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
  <a href="adminDashboard.jsp" class="active">Dashboard</a>
  <a href="listCourses">Course Management</a>
  <a href="listStudents">Student Management</a>
  <a href="pendingEnrollments">Enrollment Management</a>
  <a href="addNews.jsp">Add News Updates</a>
  <a href="listFeedback">Student Feedbacks</a>
</div>

<div class="container">
  <div class="page-header">
    <h2>Admin Dashboard</h2>
  </div>

  <div class="dashboard-cards">
    <div class="dashboard-card" onclick="location.href='listCourses'">
      <h3>Course Management</h3>
      <p>Create, edit, and delete courses offered at the university.</p>
    </div>

    <div class="dashboard-card" onclick="location.href='listStudents'">
      <h3>Student Management</h3>
      <p>Register, view, and manage student information.</p>
    </div>

    <div class="dashboard-card" onclick="location.href='pendingEnrollments'">
      <h3>Enrollment Management</h3>
      <p>Handle course enrollment records for students.</p>
    </div>

    <div class="dashboard-card" onclick="location.href='addNews.jsp'">
      <h3>Add News Updates</h3>
      <p>Publish news and important announcements for students.</p>
    </div>

    <div class="dashboard-card" onclick="location.href='listFeedback'">
      <h3>Student Feedbacks</h3>
      <p>View feedbacks from students.</p>
    </div>
  </div>
</div>

<div class="footer">
  <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
  <p>© 2025 University of Education. All rights reserved.</p>
</div>
</body>
</html>
