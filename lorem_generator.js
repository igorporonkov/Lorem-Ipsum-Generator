// lorem_generator.js
const readline = require('readline');
const fs = require('fs');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function ask(question) {
    return new Promise(resolve => rl.question(question, resolve));
}

class LoremGenerator {
    constructor() {
        this.words = [
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
        ];
    }

    generateWords(count) {
        const result = [];
        for (let i = 0; i < count; i++) {
            result.push(this.words[Math.floor(Math.random() * this.words.length)]);
        }
        return result.join(' ');
    }

    generateSentences(count) {
        const sentences = [];
        for (let i = 0; i < count; i++) {
            const wordCount = Math.floor(Math.random() * 8) + 8; // 8-15
            let sentence = this.generateWords(wordCount);
            sentence = sentence.charAt(0).toUpperCase() + sentence.slice(1) + '.';
            sentences.push(sentence);
        }
        if (sentences.length > 0) {
            sentences[0] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
        }
        return sentences.join(' ');
    }

    generateParagraphs(count) {
        const paragraphs = [];
        for (let i = 0; i < count; i++) {
            const sentCount = Math.floor(Math.random() * 4) + 3; // 3-6
            paragraphs.push(this.generateSentences(sentCount));
        }
        return paragraphs.join('\n\n');
    }
}

async function main() {
    const gen = new LoremGenerator();
    console.log("=== Lorem Ipsum Generator ===");
    while (true) {
        console.log("\n1. Generate words");
        console.log("2. Generate sentences");
        console.log("3. Generate paragraphs");
        console.log("4. Save to file");
        console.log("5. Exit");
        const choice = await ask("Choose: ");
        switch (choice.trim()) {
            case '1': {
                const count = parseInt(await ask("Enter number of words: "));
                if (isNaN(count) || count <= 0) {
                    console.log("Invalid number.");
                    break;
                }
                const result = gen.generateWords(count);
                console.log("\nResult:\n", result);
                break;
            }
            case '2': {
                const count = parseInt(await ask("Enter number of sentences: "));
                if (isNaN(count) || count <= 0) {
                    console.log("Invalid number.");
                    break;
                }
                const result = gen.generateSentences(count);
                console.log("\nResult:\n", result);
                break;
            }
            case '3': {
                const count = parseInt(await ask("Enter number of paragraphs: "));
                if (isNaN(count) || count <= 0) {
                    console.log("Invalid number.");
                    break;
                }
                const result = gen.generateParagraphs(count);
                console.log("\nResult:\n", result);
                break;
            }
            case '4': {
                const text = await ask("Enter text to save (or generate first): ");
                if (!text.trim()) {
                    console.log("No text to save. Generate something first.");
                    break;
                }
                let fname = await ask("Enter filename (default: lorem.txt): ");
                if (!fname.trim()) fname = "lorem.txt";
                try {
                    fs.writeFileSync(fname, text);
                    console.log(`Saved to ${fname}`);
                } catch (e) {
                    console.log("Error saving:", e.message);
                }
                break;
            }
            case '5':
                console.log("Goodbye!");
                rl.close();
                return;
            default:
                console.log("Invalid choice.");
        }
    }
}

main().catch(console.error);
