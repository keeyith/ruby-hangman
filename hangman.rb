require './words'

puts "Hello, you are playing hangman!!!"
random_position = rand(@words.length)
selected_word = @words[random_position]
lives = 7
guesses = [] #empty array


puts "The word is " + selected_word.length.to_s + " letters long!"

loop do
    puts "Guess a letter a-z"
   
    guessed_letter = gets.chomp
    guesses << guessed_letter  # also could use .push

    #troubleshooting
    p guesses
    
    if !selected_word.include?(guessed_letter)
        lives -=1
    end

    if lives == 0
        puts "You Lose! The word was " + selected_word
        break
    end
    
    winner = true
    selected_word.chars.each do |letter|
    
        if guesses.include?(letter)
            print letter
        else
            print "_"
            winner = false
        end
    end
    puts ""
    puts lives.to_s + " Lives Left."
    
    if winner == true
        puts "You won!"
        break
    end
end
