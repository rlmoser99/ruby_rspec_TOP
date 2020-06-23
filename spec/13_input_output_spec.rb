# frozen_string_literal: true

require_relative '../lib/13_input_output'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# Ruby code that was written before you learned how to use rpsec, may be nearly impossible to test.
# For example, in the 12_input_output file, there are two identical games - ImpossibleTestGame and NumberGame.
# Take a look at both games and look for the differences that may make it easier or harder to test.

# One key difference is that NumberGame has smaller, isolated methods.

# Small and isolated methods that only do one thing are easier to test.
# Long methods are like a run-on sentence that should have been divided into 2 or 3 different sentences so that everything could be clearly understood and in this case if each method only does one thing it will also be easier to test.

# Therefore, if you are new to testing, be open to refactoring your previous code to make writing testing easier.
# As you learn testing, you are also learning how to write better testable methods.

describe NumberGame do
  # Arrange
  subject(:game) { described_class.new }

  describe '#correct_guess?' do
    context 'when user guess is correct' do
      it 'should return true' do
        # Arrange
        game.solution = 5
        user_guess = '5'
        # Act
        guess_equals_solution = game.correct_guess?(user_guess)
        # Assert
        expect(guess_equals_solution).to be true
      end
    end

    # ASSIGNMENT
    # Write one test for when subject.game_solution does not equal correct_guess?
    context 'when user guess is not correct' do
      xit 'should return false' do
      end
    end
  end

  context '#verify_input' do
    # The method that asks for 'player_input' is not tested because it is unneccessary to test methods that only contain puts and/or gets.

    # The player_input is used in the game as an argument passed into #verify_input.
    # Note: this recursive method will repeat until a valid argument is given, due to a regex check.
    context 'when given a valid input as argument' do
      it 'should return valid input' do
        # Arrange
        user_input = '3'
        # Act
        verified_input = game.verify_input(user_input)
        # Assert
        expect(verified_input).to eq('3')
      end
    end
  end

  # It is unneccessary to write tests for methods that only contain puts statements, like #game_over.
  # Puts is a basic part of the standard ruby library & is already well tested. Plus, most 'real world applications' don't even output like this except to loggers.

  # However, here is an example of how you could test it using the output matcher
  # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/output-matcher

  context '#game_over' do
    context 'when count is 1' do
      it 'should output correct phrase' do
        subject.count = 1
        # USE DIFFERNT PHRASE NAME VARIABLES
        phrase = "LUCKY GUESS!\n"
        expect { subject.game_over }.to output(phrase).to_stdout
      end
    end

    # ASSIGNMENT
    context 'when count is 2-3' do
      xit 'should output correct phrase' do
        subject.count = 3
        # USE DIFFERNT PHRASE NAME VARIABLES
        phrase = "Congratulations! You picked the random number in 3 guesses!\n"
        # Write the expect statement for this test
        phrase # Use phrase variable
      end
    end

    # ASSIGNMENT
    context 'when count is 4 and over' do
      xit 'should output correct phrase' do
        # Write the conditions to make this test pass
        # USE DIFFERNT PHRASE NAME VARIABLES
        expect { subject.game_over }.to output(phrase).to_stdout
      end
    end
  end
end
# rubocop:enable Layout/LineLength, Metrics/BlockLength
