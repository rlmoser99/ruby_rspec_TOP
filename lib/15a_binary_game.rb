# frozen_string_literal: true

# require_relative '../lib/15c_random_number'
# require_relative '../lib/15b_binary_search'

# class for computer to find random number
class BinaryGame
  attr_reader :range, :random_number, :binary_search

  def initialize
    @range = (1..100).to_a
    @random_number = nil
    @binary_search = nil
  end

  def computer_random
    min = range[0]
    max = range[-1]
    @random_number = RandomNumber.new(min, max)
    puts "The computer-generated random number is: \e[32m#{random_number.value}\e[0m!"
    @binary_search = BinarySearch.new(min, max, random_number.value)
  end

  def user_random
    @random_number = random_number_input(player_input)
    @binary_search = BinarySearch.new(range[0], range[-1], random_number)
  end

  def find_random_number
    number = maximum_guesses
    puts "The computer will find it in \e[32m#{number}\e[0m guesses or less!\n\n"
    computer_turns
    puts "As predicted, the computer found it in \e[32m#{number}\e[0m guesses or less!"
    puts 'Game Over!'
  end

  def mode_selection
    introduction
    mode_choices
    mode_input
  end

  def computer_turns
    count = 1
    loop do
      display_range
      puts "Guess ##{count} -> \e[32m#{binary_search.make_guess}\e[0m"
      break if binary_search.game_over?

      binary_search.update_range
      count += 1
    end
  end

  protected

  def maximum_guesses
    (Math.log2(range[-1] - range[0]) + 1).to_i
  end

  def display_range
    sleep(2)
    puts ''
    range.each do |number|
      print_number(number)
    end
    puts "\n\n"
  end

  def print_number(number)
    if number == (binary_search.min + binary_search.max) / 2
      print "\e[32m#{number} \e[0m"
    elsif number.between?(binary_search.min, binary_search.max)
      print "#{number} "
    else
      print "\e[91m#{number} \e[0m"
    end
  end

  def random_number_input(number)
    return number if valid_number?(number)

    puts 'Input error!'
    random_number_input(player_input)
  end

  def valid_number?(input)
    input.between?(1, 100)
  end

  def valid_mode?(input)
    input.between?(1, 2)
  end

  def player_input
    puts "Enter a number between #{range[0]} and #{range[-1]}"
    gets.chomp.to_i
  end

  def introduction
    puts <<~HEREDOC

      Watch the computer find a number between #{range[0]} and #{range[-1]}.

      You can choose the random number or use a computer-generated number.
      Then watch the computer find that number using a binary search.

    HEREDOC
  end

  def mode_choices
    puts <<~HEREDOC

      \e[32m[1]\e[0m Choose the random number
      \e[32m[2]\e[0m Use a randomly-generated number

    HEREDOC
  end

  def mode_input
    number = gets.chomp.to_i
    return number if valid_mode?(number)

    puts 'Input error! Please select 1 or 2.'
    mode_input
  end
end
