# frozen_string_literal: true

# action to with cards at gamer
class Hand
  VAL_CARD_T = 11
  VAL_CARD_PICTURE = 10
  MAX_SUM = 21

  @card_deck = nil

  class << self
    attr_accessor :card_deck
  end

  attr_reader :sum, :cards

  def initialize(*cards)
    @cards = cards
    @sum = 0
    calculate_sum!
  end

  def add_card
    @cards << self.class.card_deck.card
    calculate_sum!
  end

  private

  def calculate_sum!
    @sum = 0
    t = 0

    @cards.each do |card|
      val = card.value
      var_val = val.to_i.positive? ? val.to_i : VAL_CARD_PICTURE
      var_val = VAL_CARD_T if val == 'T'

      @sum += var_val
      t += 1 if val == 'T'
    end

    1.upto(t) { @sum -= (VAL_CARD_T - 1) if @sum > MAX_SUM && t.positive? }
  end
end
