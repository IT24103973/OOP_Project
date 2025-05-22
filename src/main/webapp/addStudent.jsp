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
  <title>Add Student - University of Education</title>
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
  <a href="listStudents" class="active">Student Management</a>
  <a href="pendingEnrollments">Enrollment Management</a>
  <a href="addNews.jsp">Add News Updates</a>
  <a href="listFeedback">Student Feedbacks</a>
</div>

<div class="container">
  <div class="page-header">
    <h2>Add a Student</h2>
    <button class="btn btn-secondary" onclick="location.href='listStudents'">Back to List</button>
  </div>

  <form action= addStudent method="post" class="student-form">
    <div class="form-group">
      <label for="studentId">Student ID</label>
      <input type="text" id="studentId" name="studentId" required>
    </div>

    <div class="form-group">
      <label for="studentId">Student Password</label>
      <input type="text" id="studentPassword" name="studentPassword" required>
    </div>

    <div class="form-group">
      <label for="studentName">Student Name</label>
      <input type="text" id="studentName" name="studentName" required>
    </div>

    <div class="form-group">
      <label for="studentEmail">Student Email</label>
      <input type="email" id="studentEmail" name="studentEmail" required>
    </div>

    <% if (request.getAttribute("error") != null) { %>
    <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %>

    <% if (request.getAttribute("error1") != null) { %>
    <p style="color: red;"><%= request.getAttribute("error1") %></p>
    <% } %>

    <div class="form-actions">
      <button type="submit" class="btn btn-primary">Add Student</button>
      <button type="button" class="btn btn-secondary" onclick="location.href='listStudents'">Cancel</button>
    </div>
  </form>
</div>

<div class="footer">
  <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
  <p>© 2025 University of Education. All rights reserved.</p>
</div>
</body>
</html>