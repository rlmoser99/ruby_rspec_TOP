# frozen_string_literal: true

require_relative '../lib/13_input_output'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# Ruby code that was written before you learned how to use rpsec, may be nearly impossible to test.
# For example, in the 12_input_output file, there are two identical games - ImpossibleTestGame and NumberGame.
# Take a look at both games and look for the differences that may make it easier or harder to test.

# One key difference is that NumberGame has smaller, isolated methods.

# Small and isolated methods that only do one thing are easier to test.
# Long methods are like a run-on sentence that should have been divided into 2 or 3 different sentences so that everything could be clearly understood and in this case if a method does many different things it can be difficult to test.

# Therefore, if you are new to testing, be open to refactoring your previous code to make writing testing easier.
# As you learn testing, you are also learning how to write better testable methods.

describe NumberGame do
  subject(:game) { described_class.new }

  describe '#initialize' do
    it 'should be a number 0 - 9' do
      solution = game.solution
      expect(solution).to be >= 0
      expect(solution).to be < 10
    end

    # ASSIGNMENT
    # Write one test for game.solution that uses 'satisfy' instead of <, >, =
    # remove the 'x' before running this test
    xit 'should be a number between 0 and 9' do
    end
  end

  describe '#game_over?' do
    context 'when user guess is correct' do
      it 'should be game over' do
        game.solution = 5
        game.guess = '5'
        expect(game).to be_game_over
      end
    end

    # ASSIGNMENT
    # Write one test for when game.game_solution does not equal correct_guess?
    context 'when user guess is not correct' do
      # remove the 'x' before running this test
      xit 'should not be game over' do
      end
    end
  end

  describe '#verify_input' do
    # The method that asks for 'player_input' is not tested because it is a protected method and it unneccessary to test methods that only contain puts and/or gets. However, at the bottom of the answer file is an example of how to test the #player_input method if it were not protected.

    # The player_input is used in the game as an argument passed into #verify_input.
    # Note: this recursive method will repeat until a valid argument is given, due to a regex check.
    context 'when given a valid input as argument' do
      it 'should return valid input' do
        user_input = '3'
        verified_input = game.verify_input(user_input)
        expect(verified_input).to eq('3')
      end
    end
    # At the bottom of the answer file is an example of how to test the #verify_input method 'faking' an in-valid argument.
  end

  # It is unneccessary to write tests for methods that only contain puts statements, like #final_message.
  # Puts is a basic part of the standard ruby library & is already well tested. Plus, most 'real world applications' don't even output like this except to loggers.

  # However, here is an example of how you could test it using the output matcher
  # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/output-matcher

  describe '#final_message' do
    context 'when count is 1' do
      it 'should output correct phrase' do
        game.count = 1
        lucky_phrase = "LUCKY GUESS!\n"
        # The output matcher needs a block of code to assert
        expect { game.final_message }.to output(lucky_phrase).to_stdout
      end
    end

    # ASSIGNMENT
    context 'when count is 2-3' do
      # remove the 'x' before running this test
      xit 'should output correct phrase' do
        game.count = 3
        congrats_phrase = "Congratulations! You picked the random number in 3 guesses!\n"
        # Write the expect statement for this test
        congrats_phrase # Use congrats_phrase variable
      end
    end

    # ASSIGNMENT
    context 'when count is 4 and over' do
      # remove the 'x' before running this test
      xit 'should output correct phrase' do
        # Write the conditions to make this test pass
        expect { game.final_message }.to output(phrase).to_stdout
      end
    end
  end
end
# rubocop:enable Layout/LineLength, Metrics/BlockLength
