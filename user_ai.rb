# frozen_string_literal: true

require_relative 'const'

# Ai-user for dealer
class UserAi
  extend Const

  class << self
    def thinking(user)
      if user.hand.sum >= DEALER_MAX_SUM
        user.skip_turn if user.may_skip?
        puts '> Dealer skip turn'
      elsif user.may_get_card?
        user.hand.add_card
        puts '> Dealer add card'
      end
    end
  end
end
