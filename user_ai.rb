# frozen_string_literal: true

# Ai-user for dealer
class UserAi
  MAX_SUM = 17

  class << self
    def thinking(user)
      sum = CardDeck.sum_card(user.cards)

      if sum >= MAX_SUM
        user.skip_turn
      else
        user.add_card(GameInterface.new_card)
      end
    end
  end
end
