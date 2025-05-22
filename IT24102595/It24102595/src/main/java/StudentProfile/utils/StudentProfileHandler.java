package StudentProfile.utils;

import StudentProfile.model.StudentProfile;

import java.io.*;
import java.util.*;

public class StudentProfileHandler {
    private static final String FILE = "C:\\Users\\tharu\\OneDrive\\Desktop\\studentProfiles.txt";
    private static final String DELIMITER = "\\|"; // regex for reading
    private static final String SEPARATOR = "|";   // literal for writing

    public static void saveOrUpdateProfile(StudentProfile newProfile) {
        List<StudentProfile> profiles = loadAllProfiles();
        boolean updated = false;

        for (int i = 0; i < profiles.size(); i++) {
            StudentProfile existing = profiles.get(i);
            if (existing.getStudentId().equals(newProfile.getStudentId())) {
                profiles.set(i, new StudentProfile(
                        newProfile.getStudentId(),
                        !newProfile.getPhone().isBlank() ? newProfile.getPhone() : existing.getPhone(),
                        !newProfile.getAddress().isBlank() ? newProfile.getAddress() : existing.getAddress(),
                        !newProfile.getDepartment().isBlank() ? newProfile.getDepartment() : existing.getDepartment(),
                        !newProfile.getEmergency().isBlank() ? newProfile.getEmergency() : existing.getEmergency()
                ));
                updated = true;
                break;
            }
        }

        if (!updated) profiles.add(newProfile);
        writeAllProfiles(profiles);
    }

    public static StudentProfile getProfileById(String studentId) {
        return loadAllProfiles().stream()
                .filter(p -> p.getStudentId().equals(studentId))
                .findFirst()
                .orElse(null);
    }

    private static List<StudentProfile> loadAllProfiles() {
        List<StudentProfile> profiles = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(DELIMITER, -1);
                if (parts.length == 5) {
                    profiles.add(new StudentProfile(parts[0], parts[1], parts[2], parts[3], parts[4]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return profiles;
    }

    private static void writeAllProfiles(List<StudentProfile> profiles) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE))) {
            for (StudentProfile p : profiles) {
                writer.write(String.join(SEPARATOR,
                        p.getStudentId(),
                        p.getPhone(),
                        p.getAddress(),
                        p.getDepartment(),
                        p.getEmergency()));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
