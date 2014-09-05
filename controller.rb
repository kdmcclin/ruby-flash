require_relative 'view'
require_relative 'Deck_and_Card_Classes'
require 'pry'
class Controller
  attr_reader	:view, :deck
	def initialize
		@view = View.new
		@deck = Deck.new("Ruby Deck",'ruby_deck.txt')
		play
	end

	def play
		view.print_intro
		@deck.shuffle

		while !deck.end_of_game?
			answer, question = deck.grab_a_card
			view.prompt_question(question) unless deck.cards[0].guesses >0
			input = view.get_input

			if input == 'quit'
				view.print_stats(deck.get_num_correct, deck.get_num_incorrect-1)
				exit
			end

			next_step = deck.can_proceed?(input)
 			if next_step == :correct
 				view.prompt_correct
 			elsif next_step == :too_many_guesses
 				view.prompt_too_many
 				view.prompt_correct_answer(answer)
 			else next_step == :incorrect
 				view.prompt_incorrect
 			end
		end

		# p @deck.cards
		view.print_stats(deck.get_num_correct, deck.get_num_incorrect)
	end

end

Controller.new
