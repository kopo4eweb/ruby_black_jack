# frozen_string_literal: true

# this one card
class Card
  attr_reader :suit, :value

  def initialize(suit:, value:)
    @suit = suit
    @value = value
  end
end
