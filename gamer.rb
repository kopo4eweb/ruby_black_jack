# frozen_string_literal: true

# class used real user and computer
class Gamer
  attr_reader :cards # get all user cards

  def initialize(name, account = 100)
    @name = name
    @account = account
    # user cards
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def rate(value = 10)
    @account -= value
  end

  def add_win(value)
    @account += value
  end
end
