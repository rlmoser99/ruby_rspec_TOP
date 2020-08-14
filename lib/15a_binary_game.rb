# frozen_string_literal: true

# require_relative '../lib/15c_random_number'
# require_relative '../lib/15b_binary_search'

# class for computer to find random number
class BinaryGame
  attr_reader :minimum, :maximum, :random_number, :guess_count

  def initialize(minimum, maximum)
    @minimum = minimum
    @maximum = maximum
    @random_number = RandomNumber.new(minimum, maximum)
    @guess_count = 0
  end

  # Public Method *** NOT SURE WHAT TO RETURN / TEST HERE!!!
  def confirm_random_number
    introduction
    mode = player_input(1, 2)
    update_random_number if mode == 1
    @random_number.value
  end

  # REDUCE MODE SELECTION - JUST HAVE USER INPUT A NUMBER OR HIT ENTER.

  # Public Method
  def binary_search_turns
    binary_search = BinarySearch.new(@minimum, @maximum, @random_number)
    loop do
      display_range(binary_search.min, binary_search.max)
      binary_search.make_guess
      @guess_count += 1
      puts "Guess ##{@guess_count} -> \e[32m#{binary_search.guess}\e[0m\n\n"
      break if binary_search.game_over?

      binary_search.update_range
    end
  end

  # DONE
  def maximum_guesses
    (Math.log2(maximum - minimum) + 1).to_i
  end

  # DONE
  def player_input(min, max)
    number = gets.chomp.to_i
    return number if number.between?(min, max)

    puts "Input error! Please enter a number between #{min} or #{max}."
    player_input(min, max)
  end

  # DONE
  def update_random_number
    puts "Enter a number between #{minimum} and #{maximum}"
    number_input = player_input(minimum, maximum)
    @random_number.update_value(number_input)
  end

  protected

  def introduction
    puts <<~HEREDOC

      \e[32mWatch the computer find a number between #{minimum} and #{maximum} using a binary search.\e[0m

      The computer-generated random number is \e[32m#{@random_number.value}\e[0m.
      Would you like to choose your own number?

      \e[32m[1]\e[0m Choose a new number
      \e[32m[2]\e[0m Keep the randomly-generated number

    HEREDOC
  end

  def display_range(min, max)
    range = (minimum..maximum).to_a
    sleep(2)
    puts
    range.each do |number|
      print_number(min, max, number)
    end
    puts
  end

  def print_number(min, max, number)
    if number == (min + max) / 2
      print "\e[32m#{number} \e[0m"
    elsif number.between?(min, max)
      print "#{number} "
    else
      print "\e[91m#{number} \e[0m"
    end
  end
end
