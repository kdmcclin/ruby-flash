require 'pry'

class View

	def initialize 
	end

	def print_intro
		puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition."
	end

	def prompt_question(question) #takes the question and prints it out. Returns input from the user
		puts "Definition: "
		puts "- #{question.capitalize}\n\n"
		print "Guess: "
		gets.chomp
	end

	def prompt_incorrect(question)
		puts "Incorrect! Try again.\n\n"
	end

	def prompt_too_many
		puts "Incorrect! No more guesses available."		
	end

	def prompt_correct_answer(answer)
		puts "The correct answer: #{answer}"	
	end

	def prompt_correct
		puts "Correct!"
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

