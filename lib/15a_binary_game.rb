# frozen_string_literal: true

# require_relative '../lib/15c_random_number'
# require_relative '../lib/15b_binary_search'

# class for computer to find random number
class BinaryGame
  def initialize(minimum, maximum)
    @minimum = minimum
    @maximum = maximum
    @random_number = RandomNumber.new(minimum, maximum)
    @guess_count = 0
  end

  # Public Method -> 'Script' Doesn't need to be tested -> Treat inside as public too!
  def play_game
    introduction
    mode = player_input(1, 2)
    update_random_number if mode == 1
    puts "\nUsing a binary search, any number can be found in #{maximum_guesses} guesses or less!\n\n"
    display_binary_search
    puts "As predicted, the computer found it in #{@guess_count} guesses."
  end

  # Inner "Public" Method
  def player_input(min, max)
    number = gets.chomp.to_i
    return number if number.between?(min, max)

    puts "Input error! Please enter a number between #{min} or #{max}."
    player_input(min, max)
  end

  # Inner "Public" Method -> Test that it sends @random_number message
  def update_random_number
    puts "Enter a number between #{@minimum} and #{@maximum}"
    number_input = player_input(@minimum, @maximum)
    @random_number.update_value(number_input)
  end

  # Inner "Public" Method
  def maximum_guesses
    (Math.log2(@maximum - @minimum) + 1).to_i
  end

  # Inner "Public" Method -> Test that messages got sent to binary_search
  def display_binary_search
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

  protected

  # Inner "Public" Method -> Exception: contains only puts
  def introduction
    puts <<~HEREDOC

      \e[32mWatch the computer find a number between #{@minimum} and #{@maximum} using a binary search.\e[0m

      The computer-generated random number is \e[32m#{@random_number.value}\e[0m.
      Would you like to choose your own number?

      \e[32m[1]\e[0m Choose a new number
      \e[32m[2]\e[0m Keep the randomly-generated number

    HEREDOC
  end

  def display_range(min, max)
    range = (@minimum..@maximum).to_a
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
