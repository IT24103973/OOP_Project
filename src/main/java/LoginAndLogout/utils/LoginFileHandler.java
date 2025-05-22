package LoginAndLogout.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class LoginFileHandler {

    private static final String ADMINS = "C:\\Users\\it24103973\\IdeaProjects\\OOP_Project\\src\\main\\webapp\\Data\\admins.txt";
    private static final String STUDENTS = "C:\\Users\\it24103973\\IdeaProjects\\OOP_Project\\src\\main\\webapp\\Data\\students.txt";

    public static boolean validateAdmin(String username, String password) {
        return validateCredentials(ADMINS, username, password);
    }

    public static boolean validateStudent(String username, String password) {
        return validateCredentials(STUDENTS, username, password);
    }

    private static boolean validateCredentials(String filePath, String username, String password) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.strip().split(",");
                if (parts[0].equals(username) && parts[1].equals(password)) {
                    return true;
                }
            }
        } catch (IOException e) {
            e.printStackTrace(); // Log for debugging
        }
        return false;
    }
}
