package CourseEnrollment.utils;

import CourseEnrollment.model.Enrollment;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class EnrollmentFileHandler {

    private static final String FILE_PATH = "C:\\Users\\tharu\\OneDrive\\Desktop\\enrollments.txt";

    public static void saveEnrollment(Enrollment e) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(enrollmentToLine(e));
            writer.newLine();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static List<Enrollment> loadEnrollments() {
        List<Enrollment> list = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null && !line.isBlank()) {
                list.add(lineToEnrollment(line));
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    private static String enrollmentToLine(Enrollment e) {
        return e.getStudentId() + "," + e.getStudentName() + "," + e.getStudentEmail() + "," +
                e.getCourseCode() + "," + e.getEnrollmentReason().replace(",", " ") + "," +
                e.getStudyMode() + "," + e.getEnrollmentDate() + "," + e.getStatus();
    }

    private static Enrollment lineToEnrollment(String line) {
        String[] parts = line.split(",", -1); // Allow empty fields

        // Handle old records without status
        if (parts.length == 8) {
            return new Enrollment(parts[0], parts[1], parts[2], parts[3],
                    parts[4], parts[5], parts[6], parts[7]);
        } else {
            throw new IllegalArgumentException("Invalid enrollment line: " + line);
        }
    }

    public static boolean isAlreadyEnrolled(String studentId, String courseCode) {
        List<Enrollment> enrollments = loadEnrollments();
        for (Enrollment e : enrollments) {
            if (e.getStudentId().equals(studentId) && e.getCourseCode().equals(courseCode)) {
                return true;
            }
        }
        return false;
    }

    public static void overwriteEnrollments(List<Enrollment> list) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Enrollment e : list) {
                writer.write(enrollmentToLine(e));
                writer.newLine();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
