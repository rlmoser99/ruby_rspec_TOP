# frozen_string_literal: true

require_relative '../lib/15a_binary_game'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# This file can be run in the console.

def set_up
  min = 1
  max = 100
  @game = BinaryGame.new(min, max)
  @game.confirm_random_number
  # @binary_search = BinarySearch.new(@min, @max, @random_number)
  # maybe re-name back to game?
  # @predictor = BinaryPredictor.new(@min, @max, @binary_search)
  # puts "The computer will find \e[32m#{@random_number.value}\e[0m, in #{@predictor.maximum_guesses} guesses or less!\n\n"
  # start the loop (after moving it to predictor)
end

# def player_input(min, max)
#   number = gets.chomp.to_i
#   return number if number.between?(min, max)

#   puts "Input error! Please enter a number between #{min} or #{max}."
#   player_input(min, max)
# end

# def update_random_number
#   puts "Enter a number between #{@min} and #{@max}"
#   number_input = player_input(@min, @max)
#   @random_number.update_value(number_input)
# end

# def introduction
#   puts <<~HEREDOC

#     Watch the computer find a number between #{@min} and #{@max} using a binary search.

#     The computer-generated random number is \e[32m#{@random_number.value}\e[0m.
#     Would you like to choose your own number?

#     \e[32m[1]\e[0m Choose a new number
#     \e[32m[2]\e[0m Keep the randomly-generated number

#   HEREDOC
# end

def print_range(array)
  sleep(2)
  array.each do |num|
    print num
  end
  puts
end

set_up

# move this back into the predictor class & TEST IT!
# loop do
#   print_range(@predictor.color_range)
#   @binary_search.make_guess
#   @predictor.update_guess_count
#   puts "Guess ##{@predictor.guess_count} -> \e[32m#{@binary_search.guess}\e[0m\n\n"
#   # does game_over? need to be re-named, since it is not a game.
#   break if @binary_search.game_over?

#   @binary_search.update_range
# end

# puts "\e[32mAs predicted, the computer found it in #{@predictor.guess_count} guesses!\e[0m"

# ADD OPTION TO RE-PLAY - BECAUSE CREATING NEW INSTANCES SHOULD BE OUTSIDE OF THE METHOD
# def play_game
#   game = Game.new
#   game.play
#   repeat_game
# end

# def repeat_game
#   puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
#   repeat_input = gets.chomp.downcase
#   if repeat_input == 'y'
#     play_game
#   else
#     puts 'Thanks for playing!'
#   end
# end

# play_game
