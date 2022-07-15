# frozen_string_literal: true

require "player"

class Game
  attr_accessor :player1, :player2

  def initialize(player1 = nil, player2 = nil)
    @player1 = player1
    @player2 = player2
  end

  def create_players
    @player1 = Player.new
    @player2 = Player.new
  end
end