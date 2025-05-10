package CourseManagement.utils;

import CourseManagement.model.Course;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class CourseFileHandler {

    private static final String FILE_NAME = "C:\\Users\\tharu\\OneDrive\\Desktop\\database.txt";



    // Save a course to file
    public static void saveCourse(Course course) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_NAME, true))) {
            writer.write(courseToLine(course));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Load all courses from file
    public static List<Course> loadCourses() {
        List<Course> courses = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_NAME))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    courses.add(lineToCourse(line));
                    System.out.println("Loaded course: " + line);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return courses;
    }


    // Convert a Course object to a line of text
    private static String courseToLine(Course c) {
        return c.getCourseCode() + "," + c.getCourseName() + "," + c.getCourseUnit() + "," + c.getSeatLimit() + "," + c.getCourseDuration() + "," + c.getCreationDate();
    }

    // Convert a line of text back to a Course object
    private static Course lineToCourse(String line) {
        String[] parts = line.split(",");

        return new Course(
                parts[0],
                parts[1],
                parts[2],
                Integer.parseInt(parts[3]),
                Integer.parseInt(parts[4]),
                parts[5]
        );
    }
}