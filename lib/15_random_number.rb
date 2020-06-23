# frozen_string_literal: true

# class to generate random number
class RandomNumber
  attr_accessor :number

  def initialize(lowest, highest)
    sleep(3)
    @number = rand(lowest..highest)
  end
end
