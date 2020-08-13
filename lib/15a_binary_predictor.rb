# frozen_string_literal: true

# require_relative '../lib/15c_random_number'
# require_relative '../lib/15b_binary_search'

# class for computer to find random number
class BinaryPredictor
  attr_reader :range, :binary_search, :guess_count

  def initialize(min, max, binary_search)
    @range = (min..max).to_a
    @binary_search = binary_search
    @guess_count = 0
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
