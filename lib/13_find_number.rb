# frozen_string_literal: true

# class to generate random number
class RandomNumber
  attr_accessor :number

  def initialize(lowest, highest)
    sleep(3)
    @number = rand(lowest..highest)
  end
end

# class for computer to find random number
class FindNumber
  attr_accessor :answer, :min, :max, :guess

  def initialize
    @min = 0
    @max = 9
    @answer = RandomNumber.new(min, max)
  end

  # should answer be in initialize or start?
  def start
    puts "The answer is #{answer.number}"
    puts "The computer should find it in 4 guesses or less!\n\n"
    computer_guess
  end

  def computer_guess
    count = 1
    loop do
      make_guess
      puts display_guess(count)
      break if @guess == answer.number

      guess < answer.number ? @min = guess + 1 : @max = guess - 1
      count += 1
    end
  end

  def make_guess
    @guess = (min + max) / 2
  end

  def display_guess(round)
    "Round ##{round}: Guess -> #{guess}"
  end
end

# game = FindNumber.new
# game.start
