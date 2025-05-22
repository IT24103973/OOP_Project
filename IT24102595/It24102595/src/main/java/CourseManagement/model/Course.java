package CourseManagement.model;

public class Course {
    private String courseCode;
    private String courseName;
    private String courseUnit;
    private int seatLimit;
    private int courseDuration;
    private String creationDate;

    // Constructor to create a new Course object
    public Course(String courseCode, String courseName, String courseUnit, int seatLimit, int courseDuration, String creationDate) {
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.courseUnit = courseUnit;
        this.seatLimit = seatLimit;
        this.courseDuration = courseDuration;
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

    public int getCourseDuration() {
        return courseDuration;
    }

    public String getCreationDate() {
        return creationDate;
    }
}