package CourseEnrollment.model;

public class Enrollment {
    private String studentId;
    private String studentName;
    private String studentEmail;
    private String courseCode;
    private String enrollmentReason;
    private String studyMode;
    private String enrollmentDate;
    private String status;

    public Enrollment(String studentId, String studentName, String studentEmail,
                      String courseCode, String enrollmentReason, String studyMode, String enrollmentDate, String status) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.courseCode = courseCode;
        this.enrollmentReason = enrollmentReason;
        this.studyMode = studyMode;
        this.enrollmentDate = enrollmentDate;
        this.status = status;
    }

    // Getters
    public String getStudentId() { return studentId; }
    public String getStudentName() { return studentName; }
    public String getStudentEmail() { return studentEmail; }
    public String getCourseCode() { return courseCode; }
    public String getEnrollmentReason() { return enrollmentReason; }
    public String getStudyMode() { return studyMode; }
    public String getEnrollmentDate() { return enrollmentDate; }
    public String getStatus() { return status; }
}
