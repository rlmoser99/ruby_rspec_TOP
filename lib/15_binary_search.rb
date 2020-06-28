# frozen_string_literal: true

require_relative '../lib/15_random_number'

# class for computer to find random number
class BinarySearch
  attr_accessor :answer, :min, :max, :guess

  def initialize(min, max, answer = RandomNumber.new(min, max))
    @min = min
    @max = max
    @answer = answer
  end

  def start
    puts "The random number between #{min}-#{max} is #{answer.value}"
    puts "The computer will find it in #{max_guesses} guesses or less!\n\n"
    computer_turns
  end

  def max_guesses
    (Math.log2(max - min) + 1).to_i
  end

  def computer_turns
    count = 1
    loop do
      @guess = make_guess
      display_guess(count)
      break if game_over?

      update_range
      count += 1
    end
  end

  def make_guess
    (min + max) / 2
  end

  def game_over?
    guess == answer.value
  end

  def update_range
    guess < answer.value ? @min = guess + 1 : @max = guess - 1
  end

  protected

  def display_guess(count)
    sleep(3)
    puts "Guess ##{count} -> #{guess}"
  end
end

# game = BinarySearch.new(0, 9)
# game = BinarySearch.new(0, 100)
# game = BinarySearch.new(50, 151)
# game.start
