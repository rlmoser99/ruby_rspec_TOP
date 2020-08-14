# frozen_string_literal: true

require_relative '../lib/15a_binary_game'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# This file can be run in the console.

minimum = 1
maximum = 100
@game = BinaryGame.new(minimum, maximum)
@game.confirm_random_number
puts "\nUsing a binary search, any number can be found in #{@game.maximum_guesses} guesses or less!\n\n"
@game.binary_search_turns
puts "As predicted, the computer found it in #{@game.guess_count} guesses."
