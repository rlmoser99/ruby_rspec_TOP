# frozen_string_literal: true

# Create a random number for Number Game
class RandomNumber
  attr_reader :number

  def initialize
    @number = rand(0..9)
  end
end

# Game with a random number
class NumberGame
  attr_reader :game_solution

  def initialize
    @game_solution = RandomNumber.new
  end

  def play_game
    guess = verify_input(player_input)
    puts compare_guess(guess)
  end

  def compare_guess(number)
    number == game_solution.number
  end

  # def turn_order; end

  def verify_input(number)
    return number if valid_input?(number)

    puts 'Input error!'
    verify_input(player_input)
  end

  def player_input
    puts 'Choose 1-digit between 0-9'
    gets.chomp
  end

  def valid_input?(input)
    input.match(/^[0-9]$/)
  end
end

game = NumberGame.new
game.play_game
# puts game.number_solution.random_number
