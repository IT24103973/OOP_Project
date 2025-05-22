package CourseManagement.utils;

import CourseManagement.model.Course;
import CourseManagement.model.OnCampusCourse;
import CourseManagement.model.OnlineCourse;
import StudentManagement.model.Student;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class CourseFileHandler {

    private static final String COURSES = "C:\\Users\\it24103973\\IdeaProjects\\OOP_Project\\src\\main\\webapp\\Data\\courses.txt";

    // Save a course to file
    public static void saveCourse(Course course) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(COURSES, true))) {
            writer.write(courseToLine(course));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Load all courses from file
    public static List<Course> loadCourses() {
        List<Course> courses = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(COURSES))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    courses.add(lineToCourse(line));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return courses;
    }


    // Convert a Course object to a line of text
    private static String courseToLine(Course c) {
        return c.getCourseCode() + "," + c.getCourseName() + "," + c.getCourseUnit() + "," +
                c.getSeatLimit() + "," + c.getCourseDuration() + "," + c.getCreationDate() + "," + c.getCourseType();
    }

    // Convert a line of text back to a Course object
    private static Course lineToCourse(String line) {
        String[] parts = line.split(",");
        String type = (parts.length >= 7) ? parts[6] : "General";

        switch (type) {
            case "Online":
                return new OnlineCourse(parts[0], parts[1], parts[2], Integer.parseInt(parts[3]), Integer.parseInt(parts[4]), parts[5]);
            case "On-Campus":
                return new OnCampusCourse(parts[0], parts[1], parts[2], Integer.parseInt(parts[3]), Integer.parseInt(parts[4]), parts[5]);
            default:
                return new Course(parts[0], parts[1], parts[2], Integer.parseInt(parts[3]), Integer.parseInt(parts[4]), parts[5]);
        }
    }


    // Deletes a course by courseCode (Writes all other courses to a new list accept for the one to be deleted)
    public static void deleteCourse(String courseCode) {
        List<Course> allCourses = loadCourses();
        List<Course> updatedCourses = new ArrayList<>();

        for (Course c : allCourses) {
            if (!c.getCourseCode().equalsIgnoreCase(courseCode)) {
                updatedCourses.add(c);
            }
        }

        // Rewrite the file with remaining courses
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(COURSES, false))) {
            for (Course c : updatedCourses) {
                writer.write(courseToLine(c));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Check if course already exists by course code
    public static boolean isCourseExists(String code) {
        List<Course> courses = loadCourses();
        for (Course c : courses) {
            if (c.getCourseCode().equalsIgnoreCase(code)) {
                return true;
            }
        }
        return false;
    }

    public static Course getCourseByCode(String courseCode) {
        List<Course> courses = loadCourses();
        for (Course c : courses) {
            if (c.getCourseCode().equals(courseCode)) {
                return c;
            }
        }
        return null;
    }
}

