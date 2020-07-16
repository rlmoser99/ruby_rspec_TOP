# frozen_string_literal: true

# Game that is nearly impossible to test.
# Therefore is re-written below (NumberGame) with isolated methods easy to test
class ImpossibleTestGame
  attr_accessor :solution, :count

  def initialize
    @solution = rand(0..9)
  end

  def play_game
    puts "Let's play a game called 'Guess a random number!'"
    @count = 0
    loop do
      player_input
      @count += 1
      break if @guess == solution.to_s
    end
    final_message
  end

  def player_input
    loop do
      puts 'Choose 1-digit between 0-9'
      @guess = gets.chomp
      break if @guess.match(/^[0-9]$/)
    end
  end

  def final_message
    if @count == 1
      puts 'LUCKY GUESS!'
    elsif @count < 4
      puts "Congratulations! You picked the random number in #{@count} guesses!"
    else
      puts "That was hard. It took you #{@count} guesses!"
    end
  end
end

# NumberGame is the exact game as above ImpossibleTestGame
# NumberGame has small, isolated methods that are easy to test
class NumberGame
  attr_accessor :solution, :count, :guess

  def initialize
    @solution = rand(0..9)
  end

  def play_game
    puts "Let's play a game called 'Guess a random number!'"
    player_turns
    final_message
  end

  def player_turns
    @count = 0
    loop do
      @guess = verify_input(player_input)
      @count += 1
      break if game_over?
    end
  end

  def verify_input(number)
    return number if valid_input?(number)

    puts 'Input error!'
    verify_input(player_input)
  end

  def game_over?
    guess == solution.to_s
  end

  def final_message
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
    input.match?(/^[0-9]$/)
  end
end

# game = NumberGame.new
# game.play_game

# game = ImpossibleTestGame.new
# game.play_game
