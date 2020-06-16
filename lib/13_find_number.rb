# frozen_string_literal: true

# class to generate random number
class RandomNumber
  attr_accessor :number

  def initialize(lowest, highest)
    # PUT BACK FOR TEST EXAMPLES!!!
    sleep(3)
    @number = rand(lowest..highest)
  end
end

# class for computer to find random number
class FindNumber
  attr_accessor :answer, :min, :max, :guess

  def initialize(min, max, answer = RandomNumber.new(min, max))
    @min = min
    @max = max
    @answer = answer
  end

  def start
    puts "The random number between #{min}-#{max} is #{answer.number}"
    puts "The computer will find it in #{max_guesses} guesses or less!\n\n"
    computer_guess
  end

  def max_guesses
    (Math.log2(max - min) + 1).to_i
  end

  def computer_guess
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
    sleep(1)
    (min + max) / 2
  end

  def display_guess(count)
    puts "Guess ##{count} -> #{guess}"
  end

  def game_over?
    @guess == answer.number
  end

  def update_range
    guess < answer.number ? @min = guess + 1 : @max = guess - 1
  end
end

# game = FindNumber.new(0, 9)
# game = FindNumber.new(0, 100)
# game = FindNumber.new(50, 151)
# game.start
