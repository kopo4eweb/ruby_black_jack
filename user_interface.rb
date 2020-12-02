# frozen_string_literal: true

# interface user to game
class UserInterface
  class << self
    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
    def menu(user)
      @user = user

      begin
        puts 'Select:'
        puts "\t1 - skip turn" if @user.may_skip?
        puts "\t2 - get card" if @user.may_get_card?
        puts "\t3 - open cards"
        print '>> '

        operation = gets.chomp
        operation = -1 if operation !~ /^\d*$/
        operation = operation.to_i

        case operation
        when 1
          raise ArgumentError, '! Unknown operation, try again.' unless @user.may_skip?

          @user.skip_turn
        when 2
          @user.hand.add_card
        when 3
          @user.open_card
        else
          raise ArgumentError, '! Unknown operation, try again.'
        end
      rescue StandardError => e
        puts e.message
        retry
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
  end
end
