<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Login - University of Education</title>
  <link rel="stylesheet" href="CSS/login.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<div class="centered-container">
  <%
    String error = (String) request.getAttribute("error");
  %>

  <form class="login-box" action="adminLogin" method="post">
    <img src="pics/uni_logo.jpg" alt="University Logo" class="logo" />
    <h2>Admin Login</h2>

    <% if (error != null) { %>
    <p style="color: red; text-align: center;">
      <i class="fas fa-info-circle"></i> <%= error %>
    </p>
    <% } %>

    <div class="form-group">
      <label for="adminUsername">Username</label>
      <input type="text" id="adminUsername" name="adminUsername" required />
    </div>

    <div class="form-group">
      <label for="adminPassword">Password</label>
      <input type="password" id="adminPassword" name="adminPassword" required />
    </div>

    <button type="submit" class="btn btn-secondary">Login</button>
  </form>
</div>

<button class="go-back-btn2" onclick="location.href='index.jsp'">
  <i class="fas fa-arrow-left"></i> Go Back
</button>
</body>
</html>
