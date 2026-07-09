// lorem_generator.go
package main

import (
	"bufio"
	"fmt"
	"math/rand"
	"os"
	"strconv"
	"strings"
	"time"
)

type LoremGenerator struct {
	words []string
}

func NewLoremGenerator() *LoremGenerator {
	return &LoremGenerator{
		words: []string{
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
			"et", "dolore", "magnam", "aliquam", "quaerat", "voluptatem",
		},
	}
}

func (g *LoremGenerator) generateWords(count int) string {
	var sb strings.Builder
	for i := 0; i < count; i++ {
		if i > 0 {
			sb.WriteString(" ")
		}
		sb.WriteString(g.words[rand.Intn(len(g.words))])
	}
	return sb.String()
}

func (g *LoremGenerator) generateSentences(count int) string {
	var sentences []string
	for i := 0; i < count; i++ {
		wordCount := rand.Intn(8) + 8 // 8-15 words
		sentence := g.generateWords(wordCount)
		sentence = strings.Title(sentence) + "."
		sentences = append(sentences, sentence)
	}
	if len(sentences) > 0 {
		sentences[0] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
	}
	return strings.Join(sentences, " ")
}

func (g *LoremGenerator) generateParagraphs(count int) string {
	var paragraphs []string
	for i := 0; i < count; i++ {
		sentCount := rand.Intn(4) + 3 // 3-6 sentences
		para := g.generateSentences(sentCount)
		paragraphs = append(paragraphs, para)
	}
	return strings.Join(paragraphs, "\n\n")
}

func main() {
	rand.Seed(time.Now().UnixNano())
	gen := NewLoremGenerator()
	scanner := bufio.NewScanner(os.Stdin)
	fmt.Println("=== Lorem Ipsum Generator ===")
	for {
		fmt.Println("\n1. Generate words")
		fmt.Println("2. Generate sentences")
		fmt.Println("3. Generate paragraphs")
		fmt.Println("4. Save to file")
		fmt.Println("5. Exit")
		fmt.Print("Choose: ")
		scanner.Scan()
		choice := strings.TrimSpace(scanner.Text())
		switch choice {
		case "1":
			fmt.Print("Enter number of words: ")
			scanner.Scan()
			n, err := strconv.Atoi(strings.TrimSpace(scanner.Text()))
			if err != nil {
				fmt.Println("Invalid number.")
				continue
			}
			result := gen.generateWords(n)
			fmt.Println("\nResult:\n", result)
		case "2":
			fmt.Print("Enter number of sentences: ")
			scanner.Scan()
			n, err := strconv.Atoi(strings.TrimSpace(scanner.Text()))
			if err != nil {
				fmt.Println("Invalid number.")
				continue
			}
			result := gen.generateSentences(n)
			fmt.Println("\nResult:\n", result)
		case "3":
			fmt.Print("Enter number of paragraphs: ")
			scanner.Scan()
			n, err := strconv.Atoi(strings.TrimSpace(scanner.Text()))
			if err != nil {
				fmt.Println("Invalid number.")
				continue
			}
			result := gen.generateParagraphs(n)
			fmt.Println("\nResult:\n", result)
		case "4":
			fmt.Print("Enter text to save (or generate first): ")
			scanner.Scan()
			text := scanner.Text()
			if text == "" {
				fmt.Println("No text to save. Generate something first.")
				continue
			}
			fmt.Print("Enter filename (default: lorem.txt): ")
			scanner.Scan()
			fname := strings.TrimSpace(scanner.Text())
			if fname == "" {
				fname = "lorem.txt"
			}
			err := os.WriteFile(fname, []byte(text), 0644)
			if err != nil {
				fmt.Println("Error saving:", err)
			} else {
				fmt.Printf("Saved to %s\n", fname)
			}
		case "5":
			fmt.Println("Goodbye!")
			return
		default:
			fmt.Println("Invalid choice.")
		}
	}
}
