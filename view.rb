require 'pry'

class View

	def initialize 
	end

	def print_intro
		puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition."
	end

	def prompt_question(definition) #takes the definition and prints it out. Returns input from the user
		puts "Definition: "
		puts "- #{definition.capitalize}\n\n"
		print "Guess: "
		gets.chomp
	end

	def prompt_incorrect(definition)
		puts "Incorrect! Try again.\n\n"
		prompt_question(definition)
	end

	def prompt_correct
		puts "Correct!"
	end

end

