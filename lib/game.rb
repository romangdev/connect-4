# frozen_string_literal: true

require "player"

class Game
  def initialize(player1 = nil, player2 = nil)
    @player1 = player1
    @player2 = player2
  end
end