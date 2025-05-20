package StudentManagement.utils;

import CourseManagement.model.Course;
import StudentManagement.model.Student;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class StudentFileHandler {
    private static final String STUDENTS = "C:\\Users\\tharu\\OneDrive\\Desktop\\students.txt";

    public static void saveStudent(Student student) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(STUDENTS, true))) {
            writer.write(studentToLine(student));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Student> loadStudents() {
        List<Student> students = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(STUDENTS))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    students.add(lineToStudent(line));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Sort students by registration time using insertion sort
        sortByRegistrationTime(students);

        return students;
    }


    private static String studentToLine(Student s) {
        return s.getStudentId() + "," + s.getStudentPassword() + "," + s.getStudentName() + "," + s.getStudentEmail() + "," + s.getAddedDate();
    }

    private static Student lineToStudent(String line) {
        String[] parts = line.split(",");
        return new Student(parts[0], parts[1], parts[2], parts[3],parts[4]);
    }

    private static void sortByRegistrationTime(List<Student> students) {
        for (int i = 1; i < students.size(); i++) {
            Student key = students.get(i);
            int j = i - 1;

            // Descending: newer (larger timestamp) first
            while (j >= 0 && students.get(j).getAddedDate().compareTo(key.getAddedDate()) < 0) {
                students.set(j + 1, students.get(j));
                j--;
            }
            students.set(j + 1, key);
        }
    }

    public static Student getStudentById(String studentId) {
        List<Student> students = loadStudents();
        for (Student s : students) {
            if (s.getStudentId().equals(studentId)) {
                return s;
            }
        }
        return null;
    }

    public static boolean isStudentExists(String ID) {
        List<Student> students = loadStudents();
        for (Student s : students) {
            if (s.getStudentId().equalsIgnoreCase(ID)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isStudentEmailExists(String email) {
        List<Student> students = loadStudents();
        for (Student s : students) {
            if (s.getStudentEmail().equalsIgnoreCase(email)) {
                return true;
            }
        }
        return false;
    }
}