# frozen_string_literal: true

require_relative '../lib/15a_binary_predictor'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# This file can be run in the console.

def set_up(min, max)
  introduction
  mode = player_input(1, 2)
  update_random_number if mode == 1
  @binary_search = BinarySearch.new(min, max, @random_number)
  @predictor = BinaryPredictor.new(min, max, @binary_search)
end

def player_input(min, max)
  number = gets.chomp.to_i
  return number if number.between?(min, max)

  puts "Input error! Please enter a number between #{min} or #{max}."
  player_input(min, max)
end

def update_random_number
  puts "Enter a number between #{@min} and #{@max}"
  number_input = player_input(@min, @max)
  @random_number.update_value(number_input)
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

def print_range(array)
  sleep(2)
  array.each do |num|
    print num
  end
  puts
end

@min = 1
@max = 100
@random_number = RandomNumber.new(@min, @max)
set_up(@min, @max)
puts "The computer will find \e[32m#{@random_number.value}\e[0m, in #{@predictor.maximum_guesses} guesses or less!\n\n"

loop do
  print_range(@predictor.color_range)
  @binary_search.make_guess
  @predictor.update_guess_count
  puts "Guess ##{@predictor.guess_count} -> \e[32m#{@binary_search.guess}\e[0m\n\n"
  break if @binary_search.game_over?

  @binary_search.update_range
end

puts "\e[32mAs predicted, the computer found it in #{@predictor.guess_count} guesses!\e[0m"
