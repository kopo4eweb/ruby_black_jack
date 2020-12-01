# frozen_string_literal: true

module Const
  # for generate card deck
  SYMBOLS = ['♡', '♤', '♢', '♧'].freeze
  VALS = %w[2 3 4 5 6 7 8 9 10 V D K T].freeze
  VAL_CARD_T = 11
  VAL_CARD_PICTURE = 10

  # for game
  DEALER_NAME = 'Dealer'
  MAX_SUM = 21

  # for user
  SKIP = 1
  MAX_CARDS = 3
  ACCOUNT = 100
  DEF_USER_RATE = 10

  # for dealer
  DEALER_MAX_SUM = 17
end
