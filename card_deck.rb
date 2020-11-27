# frozen_string_literal: true

# card deck class
class CardDeck
  SYMBOLS = ['♡', '♤', '♢', '♧'].freeze
  VALS = %w[2 3 4 5 6 7 8 9 10 V D K T].freeze
  VAL_CARD_T = 11
  VAL_CARD_PUCTURE = 10
  MAX_SUM = 21

  def self.calculate(cards)
    sum = 0
    t = 0

    cards.each do |card|
      sum += card[:val]
      t += 1 if card[:name] == 'T'
    end

    sum -= VAL_CARD_T if sum > MAX_SUM && t.positive?

    sum
  end

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
        var_val = val.to_i.positive? ? val.to_i : VAL_CARD_PUCTURE
        var_val = VAL_CARD_T if val == 'T'
        @pack << { symbol: "#{val}#{symbol}", name: val, val: var_val }
      end
    end
  end
end
