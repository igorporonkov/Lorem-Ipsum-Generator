// lorem_generator.swift
import Foundation

class LoremGenerator {
    private let words = [
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
    ]

    func generateWords(_ count: Int) -> String {
        return (0..<count).map { _ in words.randomElement()! }.joined(separator: " ")
    }

    func generateSentences(_ count: Int) -> String {
        var sentences: [String] = []
        for _ in 0..<count {
            let wordCount = Int.random(in: 8...15)
            var sentence = generateWords(wordCount)
            sentence = sentence.prefix(1).uppercased() + sentence.dropFirst() + "."
            sentences.append(sentence)
        }
        if !sentences.isEmpty {
            sentences[0] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        }
        return sentences.joined(separator: " ")
    }

    func generateParagraphs(_ count: Int) -> String {
        var paragraphs: [String] = []
        for _ in 0..<count {
            let sentCount = Int.random(in: 3...6)
            paragraphs.append(generateSentences(sentCount))
        }
        return paragraphs.joined(separator: "\n\n")
    }
}

func main() {
    let gen = LoremGenerator()
    print("=== Lorem Ipsum Generator ===")
    while true {
        print("\n1. Generate words")
        print("2. Generate sentences")
        print("3. Generate paragraphs")
        print("4. Save to file")
        print("5. Exit")
        print("Choose: ", terminator: "")
        guard let choice = readLine()?.trimmingCharacters(in: .whitespaces) else { continue }
        switch choice {
        case "1":
            print("Enter number of words: ", terminator: "")
            if let n = Int(readLine() ?? ""), n > 0 {
                let result = gen.generateWords(n)
                print("\nResult:\n\(result)")
            } else {
                print("Invalid number.")
            }
        case "2":
            print("Enter number of sentences: ", terminator: "")
            if let n = Int(readLine() ?? ""), n > 0 {
                let result = gen.generateSentences(n)
                print("\nResult:\n\(result)")
            } else {
                print("Invalid number.")
            }
        case "3":
            print("Enter number of paragraphs: ", terminator: "")
            if let n = Int(readLine() ?? ""), n > 0 {
                let result = gen.generateParagraphs(n)
                print("\nResult:\n\(result)")
            } else {
                print("Invalid number.")
            }
        case "4":
            print("Enter text to save (or generate first): ", terminator: "")
            guard let text = readLine() else { break }
            if text.isEmpty {
                print("No text to save. Generate something first.")
                break
            }
            print("Enter filename (default: lorem.txt): ", terminator: "")
            var fname = readLine()?.trimmingCharacters(in: .whitespaces) ?? "lorem.txt"
            if fname.isEmpty { fname = "lorem.txt" }
            do {
                try text.write(toFile: fname, atomically: true, encoding: .utf8)
                print("Saved to \(fname)")
            } catch {
                print("Error saving: \(error.localizedDescription)")
            }
        case "5":
            print("Goodbye!")
            return
        default:
            print("Invalid choice.")
        }
    }
}

main()
