package CourseManagement.utils;

import CourseManagement.model.Profile;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ProfileFileHandler {

    private static final String PROFILE_FILE = "C:\\Users\\NEW\\Videos\\OOP_Project-master\\src\\studentProfiles.txt";

    public static void saveProfile(Profile profile) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(PROFILE_FILE, true))) {
            writer.write(toLine(profile));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Profile> loadProfiles() {
        List<Profile> profiles = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(PROFILE_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    profiles.add(fromLine(line));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return profiles;
    }

    public static void deleteProfile(String studentID) {
        List<Profile> all = loadProfiles();
        List<Profile> updated = new ArrayList<>();

        for (Profile p : all) {
            if (!p.getStudentID().equalsIgnoreCase(studentID)) {
                updated.add(p);
            }
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(PROFILE_FILE, false))) {
            for (Profile p : updated) {
                writer.write(toLine(p));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void updateProfile(Profile updatedProfile) {
        List<Profile> profiles = loadProfiles();

        for (int i = 0; i < profiles.size(); i++) {
            if (profiles.get(i).getStudentID().equalsIgnoreCase(updatedProfile.getStudentID())) {
                profiles.set(i, updatedProfile);
            }
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(PROFILE_FILE, false))) {
            for (Profile p : profiles) {
                writer.write(toLine(p));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void displayProfiles() {
        List<Profile> profiles = loadProfiles();
        if (profiles.isEmpty()) {
            System.out.println("No profiles found.");
            return;
        }

        System.out.println("---- Student Profiles ----");
        for (Profile p : profiles) {
            System.out.println("Name: " + p.getStudentName());
            System.out.println("ID: " + p.getStudentID());
            System.out.println("Email: " + p.getEmail());
            System.out.println("Course: " + p.getCourse());
            System.out.println("Bio: " + p.getBio());
            System.out.println("--------------------------");
        }
    }

    private static String toLine(Profile p) {
        return p.getStudentName() + "," + p.getStudentID() + "," + p.getEmail() + "," + p.getCourse() + "," + p.getBio().replace(",", " ");
    }

    private static Profile fromLine(String line) {
        String[] parts = line.split(",", 5);
        return new Profile(parts[0], parts[1], parts[2], parts[3], parts.length > 4 ? parts[4] : "");
    }
}
