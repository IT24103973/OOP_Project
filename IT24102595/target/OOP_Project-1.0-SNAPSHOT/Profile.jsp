<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="CourseManagement.model.Profile" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>University of Education</title>

    <style>
        /* General Styles */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            flex: 1;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
        }

        /* Header */
        .header {
            background-color: #003366;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .user-info {
            font-size: 14px;
        }

        /* Navigation */
        .nav {
            background-color: #004080;
            padding: 10px 20px;
        }

        .nav a {
            color: white;
            text-decoration: none;
            margin-right: 20px;
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 3px;
        }

        .nav a:hover {
            background-color: #0055a5;
        }

        .nav a.active {
            background-color: #0077cc;
        }

        /* Profile Header */
        .profile-header {
            display: flex;
            align-items: center;
            gap: 20px;
            background: #fff;
            padding: 20px;
            margin: 10px auto;
            width: 90%;
            max-width: 1000px;
            border-radius: 8px;
        }

        .profile-pic {
            width: 80px;
            height: 80px;
            background: #ccc;
            border-radius: 50%;
        }

        h1 {
            font-size: 24px;
            margin: 0;
        }

        h2 {
            font-size: 18px;
            color: #003366;
            margin-bottom: 10px;
        }

        /* Section Blocks */
        .section {
            background: #fff;
            padding: 20px;
            margin: 10px auto;
            width: 90%;
            max-width: 1000px;
            border-radius: 8px;
        }

        .section a {
            color: #e67e00;
            text-decoration: none;
            display: block;
            margin-bottom: 5px;
        }

        .bio-section {
            background: #fff;
            padding: 20px;
            margin: 10px auto;
            width: 90%;
            max-width: 1000px;
            border-radius: 8px;
        }

        .bio-form input[type="text"] {
            padding: 8px;
            margin-top: 10px;
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }


        /* Footer */
        .footer {
            background-color: #003366;
            color: white;
            padding: 15px 20px;
            text-align: center;
            font-size: 14px;
            margin-top: auto;
        }

        .footer p {
            margin: 5px 0;
        }

        .button-link {
            padding: 10px 20px;
            background-color: #0077cc;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
            cursor: pointer;
        }

        .button-link:hover {
            background-color: #005fa3;
        }


        .logo-title {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .logo {
            height: 50px;
            width: auto;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="logo-title">
        <img src="uni_logo.jpg" alt="Logo" class="logo">
        <h1>University of Education</h1>
    </div>
    <div class="user-info">Welcome, Student</div>
</div>

<div class="nav">
    <a href="#">Home</a>
    <a href="#">Course</a>
    <a href="#">Enrollment</a>
    <a href="#" class="active">Profile</a>
    <a href="#">Students</a>
    <a href="#">News</a>
</div>

<div class="container">
    <div class="section">
        <c:choose>
            <c:when test="${not empty profiles}">
                <c:forEach var="p" items="${profiles}">
                    <div style="padding: 15px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px; background: #fdfdfd;">
                        <p><strong>Student Name:</strong> <c:out value="${p.studentName}" /></p>
                        <p><strong>Student ID:</strong> <c:out value="${p.studentID}" /></p>
                        <p><strong>Email:</strong> <c:out value="${p.email}" /></p>
                        <p><strong>Course:</strong> <c:out value="${p.course}" /></p>
                        <p><strong>Bio:</strong> <c:out value="${p.bio}" /></p>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p>No profile data available.</p>
            </c:otherwise>
        </c:choose>

        <form action="index.jsp" method="get" style="display: inline-block;">
            <button type="submit" class="button-link">Edit</button>
        </form>
    </div>
</div>

<footer class="footer">
    <p>&copy;2025 University of Education. All rights reserved.</p>
    <p>Contact us: info@university.edu</p>
</footer>

</body>
</html>
