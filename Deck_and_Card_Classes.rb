require 'pry'

class Card
  attr_reader :question, :answer
  attr_accessor :played_count, :guesses
  def initialize(question,answer)
    @question = question
    @answer = answer
    @played_count = 0
    @guesses = 0
  end
end

class Deck
  attr_reader :deck_name, :file
  attr_accessor :cards
  def initialize(deck_name, file)
    @deck_name = deck_name
    @file = file
    @cards = []
    parse_txt_file()
  end

  def parse_txt_file()
    parsed_file = File.open(file)
    parsed_file.each_slice(3) do |lines|
      add_card(lines[0].delete("\n"),lines[1].delete("\n"))
    end
  end

  def shuffle
    cards.shuffle!
  end

  def grab_a_card
    cards[0].played_count += 1
    return cards[0].answer, cards[0].question
  end

  def add_card(question, answer)
    cards << Card.new(question, answer)
  end

  # def check_num_correct
  # going through card array and counting how many cards are correct
  # end

  def can_proceed?(guess)
    increase_guesses
    if check_answer_correct(guess)
      cards.rotate!
      :correct
    elsif check_num_guesses
      cards.rotate!
      :too_many_guesses
    else
      :incorrect
    end
  end

  def check_num_guesses
    cards[0].guesses > 2
  end

  def increase_guesses
    cards[0].guesses += 1
  end

  def check_answer_correct(guess)
    cards[0].answer == guess
  end

  def end_of_game?
    cards[0].played_count > 0
  end
end


my_deck = Deck.new("Ruby Deck",'ruby_deck.txt')
binding.pry
# p my_deck.cards
# puts "======================================"
# puts my_deck.grab_a_card
# puts "======================================"


