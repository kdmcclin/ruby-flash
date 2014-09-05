class Card
  attr_reader :question, :answer, :played_count, :guesses
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
    cards.shuffle
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

  # def check_can_proceed?
  #   call check_num_guesses
  #   call check_answer_correct
  #   return (correct, too_many_guesses, incorrect)
  # end

  # def check_num_guesses
  #   returns an integer
  # end

  # def check_answer_correct
  #   return boolean
  # end

  # def end_of_game?
  #   if active card.played_count > 0
  # return true
  #   else false
  # end
end

my_deck = Deck.new("Ruby Deck",'ruby_deck.txt')


