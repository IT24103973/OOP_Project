package model;

public class Course {
    private String courseCode;
    private String courseName;
    private String courseUnit;
    private int seatLimit;
    private String creationDate;

    // Constructor to create a new Course object
    public Course(String courseCode, String courseName, String courseUnit, int seatLimit, String creationDate) {
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.courseUnit = courseUnit;
        this.seatLimit = seatLimit;
        this.creationDate = creationDate;
    }

    // Getter methods
    public String getCourseCode() {
        return courseCode;
    }

    public String getCourseName() {
        return courseName;
    }

    public String getCourseUnit() {
        return courseUnit;
    }

    public int getSeatLimit() {
        return seatLimit;
    }

    public String getCreationDate() {
        return creationDate;
    }
}

