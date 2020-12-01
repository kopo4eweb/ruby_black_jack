# frozen_string_literal: true

# this one card
class Card
  attr_reader :suit, :value

  def initialize(options)
    @suit = options[:suit]
    @value = options[:value]
  end
end
