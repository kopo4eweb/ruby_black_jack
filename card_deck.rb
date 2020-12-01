# frozen_string_literal: true

require_relative 'const'
require_relative 'card'

# card deck class
class CardDeck
  include Const

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
