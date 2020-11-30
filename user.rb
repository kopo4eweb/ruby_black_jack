# frozen_string_literal: true

# class used real user and computer
class User
  SKIP = 1
  MAX_CARDS = 3
  ACCOUNT = 100
  MAX_SUM = 21

  attr_reader :cards, :name, :account, :cards_sum
  attr_writer :open_card

  def initialize(name, account = ACCOUNT, skip = SKIP, max_cards = MAX_CARDS)
    @name = name
    @account = account
    @cards = []
    @skip = skip
    @max_cards = max_cards
    @cards_sum = 0
    @losing = false
    @open_card = false
  end

  def cards_sum=(value)
    @losing = true if value > MAX_SUM
    @cards_sum = value
  end

  def reset_game
    @cards = []
    @skip = SKIP
    @cards_sum = 0
    @open_card = false
    @losing = false
  end

  def add_card(card)
    @cards << card
  end

  def rate(value = 10)
    @account -= value
    value
  end

  def add_win(value)
    @account += value
  end

  def skip_turn
    @skip -= 1
  end

  def losing?
    @losing
  end

  def may_get_card?
    @cards.size < @max_cards
  end

  def no_may_get_card?
    !may_get_card?
  end

  def may_skip?
    @skip.positive?
  end

  def no_may_skip?
    !may_skip?
  end

  def open_card?
    @open_card
  end
end
