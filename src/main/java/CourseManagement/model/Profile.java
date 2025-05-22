package CourseManagement.model;

public class Profile {
        private String studentName;
        private String studentID;
        private String email;
        private String course;
        private String bio;

        // Constructor to create a new Course object


        public Profile(String studentName, String studentID, String email, String course, String bio) {
            this.studentName = studentName;
            this.studentID = studentID;
            this.email = email;
            this.course = course;
            this.bio = bio;
        }

        // Getter methods

        public String getStudentName() {

            return studentName;
        }

        public String getStudentID() {
            return studentID;
        }

        public String getEmail() {
            return email;
        }

        public String getCourse() {
            return course;
        }

        public String getBio() {
            return bio;
        }
    }

