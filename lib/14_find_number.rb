# frozen_string_literal: true

# class for computer to find random number
class FindNumber
  attr_accessor :answer, :min, :max

  def initialize(min, max, answer = RandomNumber.new(min, max))
    @min = min
    @max = max
    @answer = answer
  end
end
