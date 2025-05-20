<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, NewsManagement.model.News, NewsManagement.utils.NewsFileHandler" %>
<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expires", 0);

  if (session == null || session.getAttribute("adminUser") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
  }

  List<News> newsList = NewsFileHandler.loadAll();
%>
<!--News view-->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Manage News - University of Education</title>
  <link rel="stylesheet" href="CSS/courseManagement.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    .news-block {
      background: #fff;
      padding: 20px;
      margin-bottom: 20px;
      border-radius: 6px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .news-block h3 {
      margin-top: 0;
      color: #003366;
    }

    .action-buttons {
      margin-top: 15px;
    }

    .btn-edit, .btn-delete {
      padding: 6px 12px;
      margin-right: 10px;
      font-size: 14px;
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
  <a href="addNews.jsp">Add News Updates</a>
</div>

<div class="container">
  <div class="page-header">
    <h2>Manage News</h2>
  </div>

  <%
    if (newsList == null || newsList.isEmpty()) {
  %>
  <p>No news found.</p>
  <%
  } else {
    for (int i = 0; i < newsList.size(); i++) {
      News news = newsList.get(i);
  %>
  <div class="news-block">
    <h3><%= news.getTitle() %></h3>
    <p><%= news.getBody() %></p>

    <div class="action-buttons">
      <button class="btn btn-edit">Edit</button>
      <button class="btn btn-delete">Delete</button>
    </div>
  </div>
  <%
      }
    }
  %>
</div>

<div class="footer">
  <p>Email: administration@university.edu.lk | Phone: +123 456 7890</p>
  <p>© 2025 University of Education. All rights reserved.</p>
</div>
</body>
</html>

