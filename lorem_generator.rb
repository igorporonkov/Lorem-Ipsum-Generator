# lorem_generator.rb
class LoremGenerator
  WORDS = %w[
    lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor
    incididunt ut labore et dolore magna aliqua enim ad minim veniam quis nostrud
    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute
    irure dolor in reprehenderit voluptate velit esse cillum fugiat nulla pariatur
    excepteur sint occaecat cupidatat non proident sunt culpa qui officia deserunt
    mollit anim id est laborum aut fugit consequuntur magni dolores eos qui ratione
    voluptatem sequi nesciunt neque porro quisquam est qui dolorem ipsum quia dolor
    sit amet consectetur adipisci velit sed quia non numquam eius modi tempora
    incidunt ut labore et dolore magnam aliquam quaerat voluptatem
  ]

  def generate_words(count)
    (1..count).map { WORDS.sample }.join(' ')
  end

  def generate_sentences(count)
    sentences = []
    count.times do
      word_count = rand(8..15)
      sentence = generate_words(word_count)
      sentence = sentence.capitalize + '.'
      sentences << sentence
    end
    sentences[0] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit." unless sentences.empty?
    sentences.join(' ')
  end

  def generate_paragraphs(count)
    paragraphs = []
    count.times do
      sent_count = rand(3..6)
      paragraphs << generate_sentences(sent_count)
    end
    paragraphs.join("\n\n")
  end
end

def main
  gen = LoremGenerator.new
  puts "=== Lorem Ipsum Generator ==="
  loop do
    puts "\n1. Generate words"
    puts "2. Generate sentences"
    puts "3. Generate paragraphs"
    puts "4. Save to file"
    puts "5. Exit"
    print "Choose: "
    choice = gets.chomp.strip
    case choice
    when '1'
      print "Enter number of words: "
      n = gets.to_i
      if n > 0
        result = gen.generate_words(n)
        puts "\nResult:\n#{result}"
      else
        puts "Invalid number."
      end
    when '2'
      print "Enter number of sentences: "
      n = gets.to_i
      if n > 0
        result = gen.generate_sentences(n)
        puts "\nResult:\n#{result}"
      else
        puts "Invalid number."
      end
    when '3'
      print "Enter number of paragraphs: "
      n = gets.to_i
      if n > 0
        result = gen.generate_paragraphs(n)
        puts "\nResult:\n#{result}"
      else
        puts "Invalid number."
      end
    when '4'
      print "Enter text to save (or generate first): "
      text = gets.chomp
      if text.empty?
        puts "No text to save. Generate something first."
        next
      end
      print "Enter filename (default: lorem.txt): "
      fname = gets.chomp.strip
      fname = "lorem.txt" if fname.empty?
      begin
        File.write(fname, text)
        puts "Saved to #{fname}"
      rescue => e
        puts "Error saving: #{e.message}"
      end
    when '5'
      puts "Goodbye!"
      break
    else
      puts "Invalid choice."
    end
  end
end

main if __FILE__ == $0
