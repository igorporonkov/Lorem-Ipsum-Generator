// LoremGenerator.java
import java.io.*;
import java.util.*;

public class LoremGenerator {
    private final List<String> words = Arrays.asList(
        "lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipiscing",
        "elit", "sed", "do", "eiusmod", "tempor", "incididunt", "ut", "labore",
        "et", "dolore", "magna", "aliqua", "enim", "ad", "minim", "veniam",
        "quis", "nostrud", "exercitation", "ullamco", "laboris", "nisi", "ut",
        "aliquip", "ex", "ea", "commodo", "consequat", "duis", "aute", "irure",
        "dolor", "in", "reprehenderit", "voluptate", "velit", "esse", "cillum",
        "fugiat", "nulla", "pariatur", "excepteur", "sint", "occaecat", "cupidatat",
        "non", "proident", "sunt", "culpa", "qui", "officia", "deserunt", "mollit",
        "anim", "id", "est", "laborum", "aut", "fugit", "consequuntur", "magni",
        "dolores", "eos", "qui", "ratione", "voluptatem", "sequi", "nesciunt",
        "neque", "porro", "quisquam", "est", "qui", "dolorem", "ipsum", "quia",
        "dolor", "sit", "amet", "consectetur", "adipisci", "velit", "sed", "quia",
        "non", "numquam", "eius", "modi", "tempora", "incidunt", "ut", "labore",
        "et", "dolore", "magnam", "aliquam", "quaerat", "voluptatem"
    );
    private Random rand = new Random();

    public String generateWords(int count) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < count; i++) {
            if (i > 0) sb.append(' ');
            sb.append(words.get(rand.nextInt(words.size())));
        }
        return sb.toString();
    }

    public String generateSentences(int count) {
        List<String> sentences = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            int wordCount = rand.nextInt(8) + 8; // 8-15
            String sentence = generateWords(wordCount);
            sentence = Character.toUpperCase(sentence.charAt(0)) + sentence.substring(1) + ".";
            sentences.add(sentence);
        }
        if (!sentences.isEmpty())
            sentences.set(0, "Lorem ipsum dolor sit amet, consectetur adipiscing elit.");
        return String.join(" ", sentences);
    }

    public String generateParagraphs(int count) {
        List<String> paragraphs = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            int sentCount = rand.nextInt(4) + 3; // 3-6
            paragraphs.add(generateSentences(sentCount));
        }
        return String.join("\n\n", paragraphs);
    }

    public static void main(String[] args) throws IOException {
        LoremGenerator gen = new LoremGenerator();
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("=== Lorem Ipsum Generator ===");
        while (true) {
            System.out.println("\n1. Generate words");
            System.out.println("2. Generate sentences");
            System.out.println("3. Generate paragraphs");
            System.out.println("4. Save to file");
            System.out.println("5. Exit");
            System.out.print("Choose: ");
            String choice = reader.readLine().trim();
            switch (choice) {
                case "1":
                    System.out.print("Enter number of words: ");
                    try {
                        int n = Integer.parseInt(reader.readLine().trim());
                        if (n <= 0) throw new NumberFormatException();
                        String result = gen.generateWords(n);
                        System.out.println("\nResult:\n" + result);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid number.");
                    }
                    break;
                case "2":
                    System.out.print("Enter number of sentences: ");
                    try {
                        int n = Integer.parseInt(reader.readLine().trim());
                        if (n <= 0) throw new NumberFormatException();
                        String result = gen.generateSentences(n);
                        System.out.println("\nResult:\n" + result);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid number.");
                    }
                    break;
                case "3":
                    System.out.print("Enter number of paragraphs: ");
                    try {
                        int n = Integer.parseInt(reader.readLine().trim());
                        if (n <= 0) throw new NumberFormatException();
                        String result = gen.generateParagraphs(n);
                        System.out.println("\nResult:\n" + result);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid number.");
                    }
                    break;
                case "4":
                    System.out.print("Enter text to save (or generate first): ");
                    String text = reader.readLine().trim();
                    if (text.isEmpty()) {
                        System.out.println("No text to save. Generate something first.");
                        break;
                    }
                    System.out.print("Enter filename (default: lorem.txt): ");
                    String fname = reader.readLine().trim();
                    if (fname.isEmpty()) fname = "lorem.txt";
                    try (FileWriter fw = new FileWriter(fname)) {
                        fw.write(text);
                        System.out.println("Saved to " + fname);
                    } catch (IOException e) {
                        System.out.println("Error saving: " + e.getMessage());
                    }
                    break;
                case "5":
                    System.out.println("Goodbye!");
                    return;
                default:
                    System.out.println("Invalid choice.");
            }
        }
    }
}
