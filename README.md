# 📝 Lorem Ipsum Generator – Multi‑Language Edition

A classic **Lorem Ipsum generator** that produces placeholder text in various formats – words, sentences, or paragraphs – with the iconic "Lorem ipsum dolor sit amet..." opening.  
Built in **7 programming languages** – perfect for design mockups, testing, or learning.

## ✨ Features
- **Generate words** – specify the exact number of words (e.g., 50 words).
- **Generate sentences** – produce a given number of complete sentences (each starts with a capital and ends with a period).
- **Generate paragraphs** – create one or more paragraphs (separated by blank lines).
- **Classic opening** – the first sentence of the first paragraph always starts with the traditional "Lorem ipsum dolor sit amet..."
- **Custom word count** – for each generated unit, you can set the desired length.
- **Random variations** – every run produces a different combination of words from a curated dictionary.
- **Save to file** – optionally write the generated text to a `.txt` file.
- **Interactive CLI** – easy‑to‑use menu with options.

## 🗂 Languages & Files
| Language          | File                      |
|-------------------|---------------------------|
| Python            | `lorem_generator.py`      |
| Go                | `lorem_generator.go`      |
| JavaScript        | `lorem_generator.js`      |
| C#                | `LoremGenerator.cs`       |
| Java              | `LoremGenerator.java`     |
| Ruby              | `lorem_generator.rb`      |
| Swift             | `lorem_generator.swift`   |

## 🚀 How to Run
Each file is standalone – run it with the appropriate interpreter/compiler:

| Language | Command |
|----------|---------|
| Python   | `python lorem_generator.py` |
| Go       | `go run lorem_generator.go` |
| JavaScript | `node lorem_generator.js` |
| C#       | `dotnet run` (or `csc LoremGenerator.cs`) |
| Java     | `javac LoremGenerator.java && java LoremGenerator` |
| Ruby     | `ruby lorem_generator.rb` |
| Swift    | `swift lorem_generator.swift` |

## 📊 Example Session
=== Lorem Ipsum Generator ===

Generate words

Generate sentences

Generate paragraphs

Save to file

Exit
Choose: 2
Enter number of sentences (default 5): 3

Generated text:
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.

text

## 🔧 Technical Details
- **Word list** – a curated set of classical Lorem Ipsum words (over 100 unique terms).
- **Randomisation** – uses the language's built‑in random generator.
- **Sentence formation** – capitalises the first letter and appends a period.
- **Paragraphs** – each paragraph consists of 3–5 sentences (randomly chosen) by default, or you can specify a fixed number of words per paragraph.

## 🤝 Contributing
Add more languages, support for custom word lists, or integration with web APIs – PRs welcome!

## 📜 License
MIT – use freely.
