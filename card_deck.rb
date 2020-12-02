# frozen_string_literal: true

require_relative 'card'

# card deck class
class CardDeck
  SYMBOLS = ['♡', '♤', '♢', '♧'].freeze
  VALS = %w[2 3 4 5 6 7 8 9 10 V D K T].freeze

  def initialize
    @cards = []
    genegate
    shuffle!
  end

  def card
    @cards.pop
  end

  private

  def shuffle!
    @cards.shuffle!
  end

  def genegate
    SYMBOLS.each do |symbol|
      VALS.each do |value|
        @cards << Card.new(suit: symbol, value: value)
      end
    end
  end
end
