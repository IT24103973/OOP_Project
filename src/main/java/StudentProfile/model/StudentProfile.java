package StudentProfile.model;

public class StudentProfile {
    private String studentId;
    private String phone;
    private String address;
    private String department;
    private String emergency;

    public StudentProfile(String studentId, String phone, String address, String department, String emergency) {
        this.studentId = studentId;
        this.phone = phone;
        this.address = address;
        this.department = department;
        this.emergency = emergency;
    }

    public String getStudentId() { return studentId; }
    public String getPhone() { return phone; }
    public String getAddress() { return address; }
    public String getDepartment() { return department; }
    public String getEmergency() { return emergency; }
}
