# frozen_string_literal: true

# class to generate random number
class RandomNumber
  attr_accessor :value

  def initialize(minimum, maximum)
    sleep(3)
    @value = rand(minimum..maximum)
  end
end
