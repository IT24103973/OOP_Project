package StudentManagement.model;

public class Student {
    private String studentId;
    private String studentPassword;
    private String studentName;
    private String studentEmail;
    private String addedDate;

    public Student(String studentId, String studentPassword, String studentName, String studentEmail, String addedDate) {
        this.studentId = studentId;
        this.studentPassword = studentPassword;
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.addedDate = addedDate;
    }

    public String getStudentId() {
        return studentId;
    }

    public String getStudentPassword() {
        return studentPassword;
    }

    public String getStudentName() {
        return studentName;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public String getAddedDate() {
        return addedDate;
    }
}
