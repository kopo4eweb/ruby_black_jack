# frozen_string_literal: true

# game
class Game
  MAX_SUM = 21

  attr_accessor :user, :dealer
  attr_reader :cards

  def initialize
    @user = nil
    @dealer = nil
    @cards = nil
    @bank = 0
  end

  def new_card_deck(cards)
    @cards = cards
  end

  def new_card
    @cards.card
  end

  def hand_over_cards
    @user.add_card(@cards.card)
    @user.add_card(@cards.card)

    @dealer.add_card(@cards.card)
    @dealer.add_card(@cards.card)
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
    "Winner '#{user.name}' with #{user.cards_sum}"
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
  def select_winner
    winner_sum = @bank
    @bank = 0
    result = nil

    if @user.losing? && @dealer.losing?
      result = 'Gamers losing!'
    elsif !@user.losing? && @dealer.losing?
      result = winner(@user, winner_sum)
    elsif !@dealer.losing? && @user.losing?
      result = winner(@dealer, winner_sum)
    elsif @user.cards_sum > @dealer.cards_sum
      result = winner(@user, winner_sum)
    elsif @dealer.cards_sum > @user.cards_sum
      result = winner(@dealer, winner_sum)
    elsif @user.cards_sum == @dealer.cards_sum
      @user.add_win(winner_sum / 2)
      @dealer.add_win(winner_sum / 2)
      result = "Draw '#{@user.name}' and '#{@dealer.name}' with #{@dealer.cards_sum}"
    end

    result
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
end
