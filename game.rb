# frozen_string_literal: true

require_relative 'hand'

# game
class Game
  attr_accessor :user, :dealer
  attr_reader :cards

  def initialize
    @user = nil
    @dealer = nil
    @cards = nil
    @bank = 0
  end

  def card_deck(cards)
    @cards = cards
  end

  def hand_over_cards
    @user.hand = Hand.new(@cards.card, @cards.card)
    @dealer.hand = Hand.new(@cards.card, @cards.card)
  end

  def rate
    @bank += @user.rate
    @bank += @dealer.rate
  end

  def no_money?
    true if @user.account.zero? || @dealer.account.zero?
  end

  def end?
    return true if @user.no_may_get_card? && @dealer.no_may_get_card?
    return true if @user.no_may_skip? && @dealer.no_may_skip?
  end

  def gamers_account
    "\tAccounts '#{@user.name}': [#{@user.account}], '#{@dealer.name}': [#{@dealer.account}]"
  end

  def winner(user, sum)
    user.add_win(sum)
    "Winner '#{user.name}' with #{user.hand.sum}"
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
  def select_winner
    winner_sum = @bank
    @bank = 0
    result = nil
    user_cards_sum = @user.hand.sum
    dealer_cards_sum = @dealer.hand.sum

    if @user.losing? && @dealer.losing?
      result = 'Gamers losing!'
    elsif !@user.losing? && @dealer.losing?
      result = winner(@user, winner_sum)
    elsif !@dealer.losing? && @user.losing?
      result = winner(@dealer, winner_sum)
    elsif user_cards_sum > dealer_cards_sum
      result = winner(@user, winner_sum)
    elsif dealer_cards_sum > user_cards_sum
      result = winner(@dealer, winner_sum)
    elsif user_cards_sum == dealer_cards_sum
      @user.add_win(winner_sum / 2)
      @dealer.add_win(winner_sum / 2)
      result = "Draw '#{@user.name}' and '#{@dealer.name}' with #{dealer_cards_sum}"
    end

    result
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
end
