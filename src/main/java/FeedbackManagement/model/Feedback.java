package FeedbackManagement.model;

public class Feedback {
    private String studentUsername;
    private String message;

    public Feedback(String studentUsername, String message) {
        this.studentUsername = studentUsername;
        this.message = message;
    }

    public String getStudentUsername() {
        return studentUsername;
    }

    public String getMessage() {
        return message;
    }
}

