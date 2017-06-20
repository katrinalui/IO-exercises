# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  winning_num = rand 1..100
  guess_count = 0
  won = false

  until won
    print "Guess a number from 1 to 100: "
    guess = gets.chomp.to_i
    guess_count += 1

    if guess == winning_num
      puts "Correct! The number was #{winning_num} and it took "\
      "#{guess_count} guesses."
      won = true
    else
      high_low = guess > winning_num ? "high" : "low"
      puts "Your guess of #{guess} is too #{high_low}."
    end
  end
end

def shuffle_file(file_name)
  base = File.basename(file_name, ".*")
  ext = File.extname(file_name)
  shuffled_lines = File.readlines(file_name).shuffle

  File.open("#{base}-shuffled#{ext}", "w") do |file|
    shuffled_lines.each { |line| file.puts line }
  end

  puts "File has been shuffled."
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    shuffle_file(ARGV[0])
  else
    puts "Please enter a filename to shuffle:"
    input_name = gets.chomp
    shuffle_file(input_name)
  end
end
