<!DOCTYPE html>
<html>
<head>
    <title>Test Add Course</title>
</head>
<body>
<h2>Add Course Test</h2>
<form action="addCourse" method="post">
    <input type="text" name="courseCode" placeholder="Course Code" required><br>
    <input type="text" name="courseName" placeholder="Course Name" required><br>
    <input type="text" name="courseUnit" placeholder="Course Unit" required><br>
    <input type="number" name="seatLimit" placeholder="Seat Limit" required><br>
    <button type="submit">Add Course</button>
</form>
</body>
</html>