# frozen_string_literal: true

require_relative '../lib/15a_binary_game'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# This file can be run in the console.

def play_game(min, max)
  introduction
  mode = player_input(1, 2)
  update_random_number if mode == 1
  @binary_search = BinarySearch.new(min, max, @random_number)
  @game = BinaryGame.new(min, max, @binary_search)
  puts "The computer will find it in \e[32m#{@game.maximum_guesses}\e[0m guesses or less!"
  binary_search_guesses
  puts "As predicted, the computer found it in \e[32m#{@game.turn_count}\e[0m guesses!"
end

def introduction
  puts <<~HEREDOC

    Watch the computer find a number between #{@min} and #{@max} using a binary search.

    The computer-generated random number is \e[32m#{@random_number.value}\e[0m.
    Would you like to choose your own number?

    \e[32m[1]\e[0m Choose a new number
    \e[32m[2]\e[0m Keep the randomly-generated number

  HEREDOC
end

def player_input(min, max)
  number = gets.chomp.to_i
  return number if number.between?(min, max)

  puts "Input error! Please select #{min} or #{max}."
  player_input(min, max)
end

def update_random_number
  puts "Enter a number between #{@min} and #{@max}"
  number_input = player_input(@min, @max)
  @random_number.update_value(number_input)
end

def binary_search_guesses
  loop do
    @game.display_range
    @binary_search.make_guess
    @game.update_turn_count
    puts "Guess ##{@game.turn_count} -> \e[32m#{@binary_search.guess}\e[0m"
    break if @binary_search.game_over?

    @binary_search.update_range
  end
end

@min = 1
@max = 100
@random_number = RandomNumber.new(@min, @max)
play_game(@min, @max)
