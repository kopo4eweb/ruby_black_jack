# frozen_string_literal: true

# card deck class
class CardDeck
  SYMBOLS = ['♡', '♤', '♢', '♧'].freeze
  VALS = %w[2 3 4 5 6 7 8 9 10 V D K T].freeze

  def initialize
    @pack = []
    genegate
    shuffle
  end

  def card
    @pack.pop
  end

  private

  def shuffle
    @pack.shuffle!
  end

  def genegate
    SYMBOLS.each do |symbol|
      VALS.each do |val|
        var_val = val.to_i.positive? ? val.to_i : 10
        var_val = 11 if val == 'T'
        @pack << { "#{val}#{symbol}" => { name: val, val: var_val } }
      end
    end
  end
end
