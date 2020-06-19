# frozen_string_literal: true

# class for computer to find random number
class FindNumber
  attr_accessor :answer, :min, :max, :guess

  def initialize(min, max, answer = RandomNumber.new(min, max))
    @min = min
    @max = max
    @answer = answer
  end

  def make_guess
    (min + max) / 2
  end

  def game_over?
    @guess == answer.value
  end

  def update_range
    guess < answer.value ? @min = guess + 1 : @max = guess - 1
  end
end
