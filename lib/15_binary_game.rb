# frozen_string_literal: true

require_relative '../lib/15_random_number'
require_relative '../lib/15_binary_search'

# class for computer to find random number
class BinaryGame
  attr_reader :range, :random_number, :game

  def initialize
    @range = (1..100).to_a
    @random_number = nil
    @game = nil
  end

  def start
    game_instructions
    mode = verify_mode(game_mode)
    mode == 1 ? user_random : computer_random
    computer_turns
  end

  def computer_turns
    count = 1
    puts "The computer will find it in \e[32m#{max_guesses}\e[0m guesses or less!\n\n"
    loop do
      display_range
      puts "Guess ##{count} -> \e[32m#{game.make_guess}\e[0m"
      break if game.game_over?

      game.update_range
      count += 1
    end
  end

  def max_guesses
    (Math.log2(range[-1] - range[0]) + 1).to_i
  end

  def user_random
    @random_number = verify_input(player_input)
    @game = BinarySearch.new(range[0], range[-1], random_number)
  end

  def computer_random
    @random_number = RandomNumber.new(range[0], range[-1])
    puts "The computer-generated random number is: \e[32m#{random_number.value}\e[0m!"
    @game = BinarySearch.new(range[0], range[-1], random_number.value)
  end

  protected

  def display_range
    sleep(2)
    puts ''
    range.each do |number|
      print_number(number)
    end
    puts "\n\n"
  end

  def print_number(number)
    if number == (game.min + game.max) / 2
      print "\e[32m#{number} \e[0m"
    elsif number.between?(game.min, game.max)
      print "#{number} "
    else
      print "\e[91m#{number} \e[0m"
    end
  end

  def verify_input(number)
    return number if valid_number?(number)

    puts 'Input error!'
    verify_input(player_input)
  end

  def verify_mode(number)
    return number if valid_mode?(number)

    puts 'Input error! Please select 1 or 2.'
    verify_mode(game_mode)
  end

  def valid_number?(input)
    input.between?(1, 100)
  end

  def valid_mode?(input)
    input.between?(1, 2)
  end

  def game_instructions
    puts <<~HEREDOC

      Watch the computer find a number between #{range[0]} and #{range[-1]}.

      You can choose the random number or use a computer-generated number.
      Then watch the computer find that number using a Binary Search.

      \e[32m[1]\e[0m Choose the random number
      \e[32m[2]\e[0m Use a randomly-generated number

    HEREDOC
  end

  def player_input
    puts "Enter a number between #{range[0]} and #{range[-1]}"
    gets.chomp.to_i
  end

  def game_mode
    gets.chomp.to_i
  end
end

# game = BinaryGame.new
# game.start
