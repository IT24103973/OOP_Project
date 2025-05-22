<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="StudentProfile.model.StudentProfile, StudentProfile.utils.StudentProfileHandler, StudentManagement.utils.StudentFileHandler, StudentManagement.model.Student" %>
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
<html>
<head>
  <meta charset="UTF-8">
  <title>Add/Update Profile Details - University of Education</title>
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
    <div class="admin-welcome">Welcome, <%= student.getStudentId() %></div>
    <form action="logout" method="get">
      <button type="submit" class="btn btn-secondary logout-btn">Logout&nbsp;&nbsp;<i class="fa fa-sign-out"></i></button>
    </form>
  </div>
</div>

<div class="nav">
  <a href="studentDashboard.jsp">Dashboard</a>
  <a href="addEnrollment.jsp">Course Enrollment</a>
  <a href="courseEnrollment.jsp">My Enrollments</a>
  <a href="studentProfile.jsp" class="active">Student Profile</a>
  <a href="news.jsp">News</a>
  <a href="addFeedback.jsp">Add Feedback</a>
</div>

<div class="container">
  <div class="page-header">
    <h2>Add / Update Profile Details</h2>
  </div>

  <form action="addStudentProfile" method="post" class="student-form">
    <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">

    <div class="form-group">
      <label for="phone">Phone Number</label>
      <input type="text" name="phone" id="phone" value="<%= profile != null ? profile.getPhone() : "" %>">
    </div>

    <div class="form-group">
      <label for="address">Address</label>
      <input type="text" name="address" id="address" value="<%= profile != null ? profile.getAddress() : "" %>">
    </div>

    <div class="form-group">
      <label for="department">Department</label>
      <input type="text" name="department" id="department" value="<%= profile != null ? profile.getDepartment() : "" %>">
    </div>

    <div class="form-group">
      <label for="emergency">Emergency Contact</label>
      <input type="text" name="emergency" id="emergency" value="<%= profile != null ? profile.getEmergency() : "" %>">
    </div>

    <div class="form-actions">
      <button type="submit" class="btn btn-primary">Save</button>
      <button type="button" class="btn btn-secondary" onclick="location.href='studentProfile.jsp'">Cancel</button>
    </div>
  </form>
</div>

<div class="footer">
  <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
  <p>© 2025 University of Education. All rights reserved.</p>
</div>

</body>
</html>
