# frozen_string_literal: true

require_relative 'game'
require_relative 'user'
require_relative 'card_deck'
require_relative 'user_interface'
require_relative 'user_ai'

# interface for class game
class GameInterface
  DEALER_NAME = 'Dealer'

  @game = nil

  class << self
    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def menu
      puts '__== Welcome to Game ==__'
      puts 'Enter your name (or enter zero for exit program)'
      print '>> '
      name = gets.chomp

      return puts 'Good bye.... See you.' if name == '0'

      raise ArgumentError, "! Empty user name, don't empty" if name.empty?

      @game = Game.new
      @game.user = User.new(name.capitalize)
      @game.dealer = User.new(DEALER_NAME)

      new_game
    rescue StandardError => e
      puts e.message
      retry
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

    # rubocop:disable Metrics/MethodLength
    def exit_game?
      loop do
        puts "\nDo you want to play again Or exit?"
        puts "\t1 - again"
        puts "\t0 - exit"
        print '>> '

        operation = gets.chomp
        operation = -1 if operation !~ /^\d*$/
        operation = operation.to_i

        case operation
        when 0
          return true
        when 1
          return false
        else
          puts '! Unknown operation, try again.'
        end
      end
    end
    # rubocop:enable Metrics/MethodLength

    # rubocop:disable Metrics/MethodLength
    def new_game
      loop do
        puts @game.gamers_account
        @game.new_card_deck(CardDeck.new)
        @game.hand_over_cards
        @game.rate
        start_game

        if @game.no_money?
          puts 'One of the players ran out of money. Exit game.'
          break
        end

        break if exit_game?

        reset_users
      end
    end
    # rubocop:enable Metrics/MethodLength

    def start_game
      loop do
        show_cards

        UserInterface.menu(@game.user)
        break if @game.user.open_card?

        UserAi.thinking(@game.dealer)

        break if @game.end?
      end

      show_cards(true)
      puts @game.select_winner
      puts @game.gamers_account
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Style/OptionalBooleanParameter
    def show_cards(show_all = false)
      puts 'Cards:'

      # user
      print "\t#{@game.user.name} "
      @game.user.cards.each do |card|
        print "[#{card[:symbol]}]"
      end
      @game.user.cards_sum = CardDeck.sum_card(@game.user.cards)
      print " sum: #{@game.user.cards_sum}"
      print "\n"

      # dealer
      print "\t#{@game.dealer.name} "
      @game.dealer.cards.each do |card|
        print show_all ? "[#{card[:symbol]}]" : '[*]'
      end
      @game.dealer.cards_sum = CardDeck.sum_card(@game.dealer.cards)
      print " sum: #{@game.dealer.cards_sum}" if show_all
      print "\n"
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Style/OptionalBooleanParameter

    def new_card
      @game.new_card
    end

    def reset_users
      @game.user.reset_game
      @game.dealer.reset_game
    end
  end
end
