# frozen_string_literal: true

# Ai-user for dealer
class UserAi
  DEALER_MAX_SUM = 17

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
