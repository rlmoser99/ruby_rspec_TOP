# frozen_string_literal: true

require_relative '../lib/15a_binary_game'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# This file can be run in the console.

def start_game
  game = BinaryGame.new
  mode = game.mode_selection
  mode == 1 ? game.user_random : game.computer_random
  game.find_random_number
end

start_game
