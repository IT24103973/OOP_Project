package FeedbackManagement.utils;

import FeedbackManagement.model.Feedback;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackFileHandler {
    private static final String FILE = "C:\\Users\\tharu\\OneDrive\\Desktop\\feedback.txt";
    private static final String SEP = "|";

    public static void save(Feedback fb) {
        try (BufferedWriter w = new BufferedWriter(new FileWriter(FILE, true))) {
            w.write(fb.getStudentUsername().replace(SEP, " ") + SEP +
                    fb.getMessage().replace(SEP, " "));
            w.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Feedback> loadAll() {
        List<Feedback> list = new ArrayList<>();
        try (BufferedReader r = new BufferedReader(new FileReader(FILE))) {
            String line;
            while ((line = r.readLine()) != null) {
                String[] parts = line.split("\\|", 2);
                if (parts.length == 2)
                    list.add(new Feedback(parts[0], parts[1]));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }
}
