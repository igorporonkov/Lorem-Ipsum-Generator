# lorem_generator.py
import random
import sys

class LoremGenerator:
    def __init__(self):
        self.words = [
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

    def generate_words(self, count):
        return ' '.join(random.choice(self.words) for _ in range(count))

    def generate_sentences(self, count, words_per_sentence=12):
        sentences = []
        for i in range(count):
            word_count = random.randint(8, 15) if words_per_sentence is None else words_per_sentence
            words = [random.choice(self.words) for _ in range(word_count)]
            sentence = ' '.join(words)
            # Capitalise first letter and add period
            sentence = sentence.capitalize() + '.'
            sentences.append(sentence)
        # Ensure classic opening for first sentence
        if sentences:
            sentences[0] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        return ' '.join(sentences)

    def generate_paragraphs(self, count, sentences_per_paragraph=4):
        paragraphs = []
        for p in range(count):
            sent_count = random.randint(3, 6) if sentences_per_paragraph is None else sentences_per_paragraph
            para_sentences = self.generate_sentences(sent_count)
            paragraphs.append(para_sentences)
        return '\n\n'.join(paragraphs)

def main():
    gen = LoremGenerator()
    print("=== Lorem Ipsum Generator ===")
    while True:
        print("\n1. Generate words")
        print("2. Generate sentences")
        print("3. Generate paragraphs")
        print("4. Save to file")
        print("5. Exit")
        choice = input("Choose: ").strip()
        if choice == '1':
            try:
                count = int(input("Enter number of words: "))
                result = gen.generate_words(count)
                print("\nResult:\n", result)
            except ValueError:
                print("Invalid number.")
        elif choice == '2':
            try:
                count = int(input("Enter number of sentences: "))
                result = gen.generate_sentences(count)
                print("\nResult:\n", result)
            except ValueError:
                print("Invalid number.")
        elif choice == '3':
            try:
                count = int(input("Enter number of paragraphs: "))
                result = gen.generate_paragraphs(count)
                print("\nResult:\n", result)
            except ValueError:
                print("Invalid number.")
        elif choice == '4':
            text = input("Enter text to save (or generate first): ").strip()
            if not text:
                print("No text to save. Generate something first.")
                continue
            fname = input("Enter filename (default: lorem.txt): ").strip() or "lorem.txt"
            with open(fname, 'w', encoding='utf-8') as f:
                f.write(text)
            print(f"Saved to {fname}")
        elif choice == '5':
            print("Goodbye!")
            break
        else:
            print("Invalid choice.")

if __name__ == "__main__":
    main()
