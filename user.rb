# frozen_string_literal: true

require_relative 'const'

# class used real user and computer
class User
  include Const

  attr_accessor :hand
  attr_reader :name, :account

  def initialize(name, account = ACCOUNT, skip = SKIP, max_cards = MAX_CARDS)
    @name = name
    @account = account
    @skip = skip
    @max_cards = max_cards
    @open_card = false
  end

  def reset_game
    @skip = SKIP
    @open_card = false
  end

  def rate(value = DEF_USER_RATE)
    @account -= value
    value
  end

  def add_win(value)
    @account += value
  end

  def skip_turn
    @skip -= 1
  end

  def open_card
    @open_card = true
  end

  def losing?
    @hand.sum > MAX_SUM
  end

  def may_get_card?
    @hand.cards.size < @max_cards
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
