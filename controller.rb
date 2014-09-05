require_relative 'view'


class Controller

	def initialize
		@view = View.new
		@deck = Deck.new
		play
	end

	def play
		@deck.shuffle
		unless @deck.end_of_game?
			
			answer, question = @deck.grab_a_card
			@input = @view.prompt_question(question)

			if @input == 'exit'
				break
 			elsif can_proceed?(@input) == :correct
 				@view.prompt_correct
 			elsif can_proceed?(@input) == :too_many_guesses
 				@view.prompt_too_many
 				@view.prompt_correct_answer(answer)
 			else can_proceed?(@input) == :incorrect
 				@view.prompt_incorrect
 			end		
		end
		@view.print_stats(@deck.get_num_correct, @deck.get_num_incorrect)
	end

end
