<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<!-- Header -->
<div class="header">
    <div class="logo-title">
        <img src="uni_logo.jpg" alt="Logo" class="logo">
        <h1>University of Education</h1>
    </div>
    <div class="user-info">Welcome, Student</div>
</div>

<div class="container">
    <div class="section">
        <form action="addProfile" method="post">
            <label>Student Name:</label><br>
            <input type="text" name="studentName" required><br><br>

            <label>Student ID:</label><br>
            <input type="text" name="studentID" required><br><br>

            <label>Email:</label><br>
            <input type="email" name="email" required><br><br>

            <label>Course:</label><br>
            <input type="text" name="course"><br><br>

            <label>Bio:</label><br>
            <textarea name="bio" rows="5" cols="30"></textarea><br><br>

            <button type="submit">Save Profile</button>
        </form>
    </div>
</div>
<!-- Footer -->
<footer class="footer">
    <p>&copy;2025 University of Education. All rights reserved.</p>
    <p>Contact us: info@university.edu</p>
</footer>

</body>
</html>
