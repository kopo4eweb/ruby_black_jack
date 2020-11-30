# frozen_string_literal: true

# Ai-user for dealer
class UserAi
  DEALER_MAX_SUM = 17

  class << self
    def thinking(user)
      sum = CardDeck.sum_card(user.cards)

      if sum >= DEALER_MAX_SUM
        user.skip_turn if user.may_skip?
      elsif user.may_get_card?
        user.add_card(GameInterface.new_card)
      end
    end
  end
end
