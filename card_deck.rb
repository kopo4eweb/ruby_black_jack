# frozen_string_literal: true

# card deck class
class CardDeck
  def initialize
    @symbols = ['♡', '♤', '♢', '♧']
    @vals = %w[2 3 4 5 6 7 8 9 10 V D K T]
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
    @symbols.each do |symbol|
      @vals.each do |val|
        var_val = val.to_i.positive? ? val.to_i : 10
        var_val = 11 if val == 'T'
        @pack << { "#{val}#{symbol}" => var_val }
      end
    end
  end
end
