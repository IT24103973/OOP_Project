<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, StudentManagement.model.Student" %>
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
  <a href="listCourses">Course Management</a>
  <a href="listStudents" class="active">Student Management</a>
  <a href="pendingEnrollments">Enrollment Management</a>
  <a href="addNews.jsp">Add News Updates</a>
  <a href="listFeedback">Student Feedbacks</a>
</div>

<div class="container">
  <div class="page-header">
    <h2>Student Management</h2>
    <button class="btn btn-primary" onclick="location.href='addStudent.jsp'">Add new Student</button>
  </div>

  <table>
    <thead>
    <tr>
      <th>#</th>
      <th>Student ID</th>
      <th>Student Password</th>
      <th>Name</th>
      <th>Email</th>
      <th>Added Date and time</th>
      <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Student> students = (List<Student>) request.getAttribute("students");
      if (students != null) {
        int i = students.size();
        for (Student s : students) {
    %>
    <tr>
      <td><%= i-- %></td>
      <td><%= s.getStudentId() %></td>
      <td><%= s.getStudentPassword()%></td>
      <td><%= s.getStudentName() %></td>
      <td><%= s.getStudentEmail() %></td>
      <td><%= s.getAddedDate() %></td>
      <td>
        <form action="editCourse.jsp" method="get" style="display:inline;">
          <input type="hidden" name="StudentID" value="<%= s.getStudentId() %>"/>
          <button type="submit" class="btn btn-edit">Edit</button>
        </form>

        <form action="deleteStudent" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this course?');">
          <input type="hidden" name="StudentID" value="<%= s.getStudentId() %>"/>
          <button type="submit" class="btn btn-delete">Delete</button>
        </form>
      </td>
    </tr>
    <%
        }
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
