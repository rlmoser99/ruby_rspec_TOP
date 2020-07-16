# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength, Layout/LineLength

# NumberPickGame has small, isolated methods that are easy to test
class NumberPickGame
  attr_accessor :solution, :count, :guess
  class InvalidInputError < StandardError; end

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
      player_guess
      @count += 1
      break if game_over?
    end
  end

  def player_guess
    @guess = player_input
    raise InvalidInputError unless guess.match(/^[0-9]$/)
  rescue InvalidInputError
    puts 'Invalid input'
    retry
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
end

# game = NumberPickGame.new
# game.play_game

describe NumberPickGame do
  subject(:game) { described_class.new }
  class InvalidInputError < StandardError; end

  describe '#play_game' do
    it 'plays the game' do
      expect(game).to receive(:puts).once
      expect(game).to receive(:player_turns).once
      expect(game).to receive(:final_message).once
      game.play_game
    end

    # it 'plays the game number 2' do
    #   game.play_game
    #   expect(game).to have_received(:puts).once
    #   expect(game).to have_received(:player_turns).once
    #   expect(game).to have_received(:final_message).once
    # end
  end

  describe '#player_turns' do
    it 'plays one round' do
      allow(game).to receive(:player_guess)
      allow(game).to receive(:game_over?).and_return(true)
      game.player_turns
      count = game.count
      expect(count).to eq(1)
      expect(game).to have_received(:player_guess).once
    end

    it 'plays two rounds' do
      allow(game).to receive(:player_guess)
      allow(game).to receive(:game_over?).and_return(false, true)
      game.player_turns
      count = game.count
      expect(count).to eq(2)
      expect(game).to have_received(:player_guess).twice
    end

    it 'plays seven rounds' do
      allow(game).to receive(:player_guess)
      allow(game).to receive(:game_over?).and_return(false, false, false, false, false, false, true)
      game.player_turns
      count = game.count
      expect(count).to eq(7)
      expect(game).to have_received(:player_guess).exactly(7).times
    end
  end

  describe '#player_guess' do
    # WARNING: .not_to raise_error(SpecificErrorClass)` risks false positives, since literally any other error would cause the expectation to pass, including those raised by Ruby (e.g. NoMethodError, NameError and ArgumentError), meaning the code you are intending to test may not even get reached. Instead consider using `expect { }.not_to raise_error`
    context 'when guess is valid' do
      it 'raises no errors and guess is correct' do
        user_input = '3'
        allow(game).to receive(:player_input).and_return(user_input)
        expect { game.player_guess }.not_to raise_error
        expect(game).not_to receive(:puts).with('Invalid input')
        guess = game.guess
        expect(guess).to eq('3')
      end
    end

    # Can not test for an error that was rescued, only the conditions that would happen during rescue.
    # Fensus said 'An error would only be raised if it's raised in your rescue. Because you rescue and don't subsequently raise it again, nothing from the outside would ever know an error is raised (because it isnt). So you couldn't test for an error raising if you wanted to with your current code.'
    context 'when guess is not valid' do
      it 'rescues the errors and prompts user for valid input' do
        letter_input = 'd'
        number_input = '2'
        allow(game).to receive(:player_input).and_return(letter_input, number_input)
        expect(game).to receive(:puts).once.with('Invalid input')
        expect(game).to receive(:player_input).twice
        expect { game.player_guess }.not_to raise_error
        guess = game.guess
        expect(guess).to eq('2')
      end
    end
  end
end

# Previous tests written in input_output test file.
describe NumberPickGame do
  subject(:game) { described_class.new }

  describe '#initialize' do
    matcher :be_between_zero_and_nine do
      match { |number| number.between?(0, 9) }
    end

    it 'is a number between 0 and 9' do
      solution = game.solution
      expect(solution).to be_between_zero_and_nine
    end
  end

  describe '#game_over?' do
    context 'when user guess is correct' do
      it 'is game over' do
        game.solution = 5
        game.guess = '5'
        expect(game).to be_game_over
      end
    end

    context 'when user guess is not correct' do
      it 'is not game over' do
        game.solution = 5
        game.guess = '2'
        expect(game).to_not be_game_over
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength, Layout/LineLength
