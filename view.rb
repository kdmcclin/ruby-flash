require 'pry'

 def print_by_letter(string)
    string.chars.each {|char| sleep 0.02; print char}
    puts ""
  end

class View

	def initialize
	end
	def print_intro
		print_by_letter('=========================================================')
		puts '___________.____       _____    _________ ___ ___'
    sleep 0.3
		puts '\_   _____/|    |     /  _  \  /   _____//   |   \\'
		sleep 0.3
		puts ' |    __)  |    |    /  /_\  \ \_____  \/    ~    \\'
		sleep 0.3
		puts ' |     \   |    |___/    |    \/        \    Y    /'
		sleep 0.3
		puts ' \___  /   |_______ \____|__  /_______  /\___|_  / '
		sleep 0.3
		puts '     \/            \/       \/        \/       \/ '
		sleep 0.3
		print_by_letter "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition."
	end

	def prompt_question(question) #takes the question and prints it out. Returns input from the user
		print_by_letter "=========================================================\n\n"
		print_by_letter "DEFINITION:\n"
		print_by_letter "#{question.capitalize}\n\n"
	end

	def get_input
    print "GUESS: "
    gets.chomp
	end

	def prompt_incorrect
		puts "Incorrect! Try again.\n\n"
	end

	def prompt_too_many
		puts "Incorrect! No more guesses available."
	end

	def prompt_correct_answer(answer)
		puts "The correct answer: #{answer}\n"
		puts "=========================================================\n"
	end

	def prompt_correct
		puts "Correct!\n"
		puts "=========================================================\n"
	end

	def print_stats(correct, incorrect)
		line
		puts "Number of correct: #{correct}"
		puts "Number of incorrect: #{incorrect}"
		line
	end

	def line
		puts "----------"
	end

end

