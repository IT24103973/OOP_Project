package NewsManagement.utils;

import NewsManagement.model.News;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class NewsFileHandler {

    private static final String FILE = "C:\\Users\\tharu\\OneDrive\\Desktop\\news.txt";
    private static final String SEP  = "|";

    public static void save(News news) {
        try (BufferedWriter w = new BufferedWriter(new FileWriter(FILE, true))) {
            w.write(news.getTitle().replace(SEP, " ") + SEP +
                    news.getBody().replace(SEP, " "));
            w.newLine();
        } catch (IOException e) { e.printStackTrace(); }
    }

    public static List<News> loadAll() {
        List<News> list = new ArrayList<>();
        try (BufferedReader r = new BufferedReader(new FileReader(FILE))) {
            String line;
            while ((line = r.readLine()) != null) {
                String[] p = line.split("\\|", 2);          // split once
                if (p.length == 2) list.add(new News(p[0], p[1]));
            }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }
}
