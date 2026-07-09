// LoremGenerator.cs
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

class LoremGenerator
{
    private readonly List<string> words = new List<string>
    {
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
    };
    private Random rand = new Random();

    public string GenerateWords(int count)
    {
        var sb = new StringBuilder();
        for (int i = 0; i < count; i++)
        {
            if (i > 0) sb.Append(' ');
            sb.Append(words[rand.Next(words.Count)]);
        }
        return sb.ToString();
    }

    public string GenerateSentences(int count)
    {
        var sentences = new List<string>();
        for (int i = 0; i < count; i++)
        {
            int wordCount = rand.Next(8, 16); // 8-15
            string sentence = GenerateWords(wordCount);
            sentence = char.ToUpper(sentence[0]) + sentence.Substring(1) + ".";
            sentences.Add(sentence);
        }
        if (sentences.Count > 0)
            sentences[0] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
        return string.Join(" ", sentences);
    }

    public string GenerateParagraphs(int count)
    {
        var paragraphs = new List<string>();
        for (int i = 0; i < count; i++)
        {
            int sentCount = rand.Next(3, 7); // 3-6
            paragraphs.Add(GenerateSentences(sentCount));
        }
        return string.Join("\n\n", paragraphs);
    }

    static void Main()
    {
        var gen = new LoremGenerator();
        Console.WriteLine("=== Lorem Ipsum Generator ===");
        while (true)
        {
            Console.WriteLine("\n1. Generate words");
            Console.WriteLine("2. Generate sentences");
            Console.WriteLine("3. Generate paragraphs");
            Console.WriteLine("4. Save to file");
            Console.WriteLine("5. Exit");
            Console.Write("Choose: ");
            string choice = Console.ReadLine()?.Trim() ?? "";
            switch (choice)
            {
                case "1":
                    Console.Write("Enter number of words: ");
                    if (int.TryParse(Console.ReadLine(), out int n) && n > 0)
                    {
                        string result = gen.GenerateWords(n);
                        Console.WriteLine("\nResult:\n" + result);
                    }
                    else Console.WriteLine("Invalid number.");
                    break;
                case "2":
                    Console.Write("Enter number of sentences: ");
                    if (int.TryParse(Console.ReadLine(), out n) && n > 0)
                    {
                        string result = gen.GenerateSentences(n);
                        Console.WriteLine("\nResult:\n" + result);
                    }
                    else Console.WriteLine("Invalid number.");
                    break;
                case "3":
                    Console.Write("Enter number of paragraphs: ");
                    if (int.TryParse(Console.ReadLine(), out n) && n > 0)
                    {
                        string result = gen.GenerateParagraphs(n);
                        Console.WriteLine("\nResult:\n" + result);
                    }
                    else Console.WriteLine("Invalid number.");
                    break;
                case "4":
                    Console.Write("Enter text to save (or generate first): ");
                    string text = Console.ReadLine() ?? "";
                    if (string.IsNullOrWhiteSpace(text))
                    {
                        Console.WriteLine("No text to save. Generate something first.");
                        break;
                    }
                    Console.Write("Enter filename (default: lorem.txt): ");
                    string fname = Console.ReadLine()?.Trim() ?? "lorem.txt";
                    if (string.IsNullOrEmpty(fname)) fname = "lorem.txt";
                    try
                    {
                        File.WriteAllText(fname, text);
                        Console.WriteLine($"Saved to {fname}");
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("Error saving: " + e.Message);
                    }
                    break;
                case "5":
                    Console.WriteLine("Goodbye!");
                    return;
                default:
                    Console.WriteLine("Invalid choice.");
                    break;
            }
        }
    }
}
