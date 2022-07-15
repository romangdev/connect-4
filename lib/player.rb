# frozen_string_literal: true

class Player
  attr_accessor :player_symbol

  def initialize(player_number = nil, player_symbol = nil)
    @player_number = player_number
    @player_symbol = player_symbol
  end

  def assign_symbol(symbol)
    @player_symbol = symbol
  end
end