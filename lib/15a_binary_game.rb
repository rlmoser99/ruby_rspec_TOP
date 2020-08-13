# frozen_string_literal: true

# require_relative '../lib/15c_random_number'
# require_relative '../lib/15b_binary_search'

# class for computer to find random number
class BinaryGame
  attr_reader :range
  # :binary_search, :guess_count

  def initialize(min, max)
    @range = (min..max).to_a
    @random_number = RandomNumber.new(min, max)
    # @binary_search = nil
    # @guess_count = 0
  end

  def confirm_random_number
    introduction
    mode = player_input(1, 2)
    update_random_number if mode == 1
    @random_number.value
  end

  def update_guess_count
    @guess_count += 1
  end

  def maximum_guesses
    (Math.log2(range[-1] - range[0]) + 1).to_i
  end

  def color_range(pretty_range = [])
    range.each do |number|
      pretty_range << color_number(number)
    end
    pretty_range
  end

  def introduction
    puts <<~HEREDOC
  
      Watch the computer find a number between #{@range[0]} and #{@range[-1]} using a binary search.

      The computer-generated random number is \e[32m#{@random_number.value}\e[0m.
      Would you like to choose your own number?

      \e[32m[1]\e[0m Choose a new number
      \e[32m[2]\e[0m Keep the randomly-generated number

    HEREDOC
  end

  def player_input(min, max)
    number = gets.chomp.to_i
    return number if number.between?(min, max)
  
    puts "Input error! Please enter a number between #{min} or #{max}."
    player_input(min, max)
  end
  
  def update_random_number
    puts "Enter a number between #{range[0]} and #{range[-1]}"
    number_input = player_input(range[0], range[-1])
    @random_number.update_value(number_input)
  end

  protected

  def color_number(number)
    if number == (binary_search.min + binary_search.max) / 2
      "\e[32m#{number} \e[0m"
    elsif number.between?(binary_search.min, binary_search.max)
      "#{number} "
    else
      "\e[91m#{number} \e[0m"
    end
  end
end
