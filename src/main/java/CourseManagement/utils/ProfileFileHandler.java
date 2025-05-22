package CourseManagement.utils;

import CourseManagement.model.Profile;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ProfileFileHandler {

    private static final String PROFILE_FILE = "C:\\Users\\NEW\\Desktop\\studentProfiles.txt";

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
        File file = new File(PROFILE_FILE);
        System.out.println("Looking for file: " + file.getAbsolutePath());

        if (!file.exists()) {
            System.out.println("Profile file does not exist!");
            return profiles;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println("Reading line: " + line);
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

    private static String toLine(Profile p) {
        // Replace any commas in bio to avoid breaking CSV format
        String cleanBio = p.getBio().replace(",", " ");
        return String.join(",", p.getStudentName(), p.getStudentID(), p.getEmail(), p.getCourse(), cleanBio);
    }

    private static Profile fromLine(String line) {
        String[] parts = line.split(",", 5);
        return new Profile(parts[0], parts[1], parts[2], parts[3], parts.length > 4 ? parts[4] : "");
    }
}
