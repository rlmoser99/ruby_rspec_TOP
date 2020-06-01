# frozen_string_literal: true

# Game to find the random number
class NumberGame
  attr_accessor :game_solution, :count

  def initialize
    @game_solution = rand(0..9)
  end

  def play_game
    puts "Let's play a game called 'Guess a random number!'"
    @count = 0
    loop do
      guess = verify_input(player_input)
      @count += 1
      break if correct_guess?(guess)
    end
    game_over
  end

  def correct_guess?(number)
    number == game_solution.to_s
  end

  def verify_input(number)
    return number if valid_input?(number)

    puts 'Input error!'
    verify_input(player_input)
  end

  def game_over
    if @count == 1
      puts 'LUCKY GUESS!'
    elsif @count < 4
      puts "Congratulations! You picked the random number in #{@count} guesses!"
    else
      puts "That was hard. It took you #{@count} guesses!"
    end
  end

  protected

  def player_input
    puts 'Choose 1-digit between 0-9'
    gets.chomp
  end

  def valid_input?(input)
    input.match(/^[0-9]$/)
  end
end

# game = NumberGame.new
# game.play_game
