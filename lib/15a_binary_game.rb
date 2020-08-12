# frozen_string_literal: true

# require_relative '../lib/15c_random_number'
# require_relative '../lib/15b_binary_search'

# class for computer to find random number
class BinaryGame
  attr_reader :range, :binary_search, :turn_count

  def initialize(min, max, binary_search)
    @range = (min..max).to_a
    @binary_search = binary_search
    @turn_count = 0
  end

  # move to binary_search -> guess count
  def update_turn_count
    @turn_count += 1
  end

  # move to binary_search
  def maximum_guesses
    (Math.log2(range[-1] - range[0]) + 1).to_i
  end

  # Maybe make this break into lines of 10 digits... Return value?
  def display_range
    sleep(2)
    puts ''
    range.each do |number|
      print_number(number)
    end
    puts "\n\n"
  end

  protected

  def print_number(number)
    if number == (binary_search.min + binary_search.max) / 2
      print "\e[32m#{number} \e[0m"
    elsif number.between?(binary_search.min, binary_search.max)
      print "#{number} "
    else
      print "\e[91m#{number} \e[0m"
    end
  end
end
