# frozen_string_literal: true

require_relative '../lib/12_input_output'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# Ruby code that was written before you learned how to use rpsec, may be nearly impossible to test.
# For example, in the 12_input_output file, there are two identical games - ImpossibleTestGame and NumberGame.
# Take a look at both games and look for the differences that may make it easier or harder to test.

# One key difference is that NumberGame has smaller, isolated methods.

# Small and isolated methods that only do one thing are easier to test.
# Long methods are like a run-on sentence that should have been divided into 2 or 3 different sentences so that everything could be clearly understood and in this case if each method only does one thing it will also be easier to test.

# Therefore, if you are new to testing, be open to refactoring your previous code to make writing testing easier.
# As you learn testing, you are also learning how to write better testable methods.

# In addition, we are going to start using Arrange-Act-Assert to format each test.
# http://www.chrisrolle.com/en/blog/testing-arrange-act-assert
# https://youtu.be/sCthIEOaMI8

# 1. Arrange -> set-up the test (for example: initializing objects, let variables, updating values of instance variables, etc.)
# 2. Act -> executing the logic to test (for example: calling a method to run)
# 3. Assert -> expect the results of arrange & act

# Warning: When you start using A-A-A to format your tests, it can feel counter-intuitive to DRY (don't repeat yourself)
# Using repetition is unavoidable in read-able tests, which is the project's 'living documention' and should be very explicit.

describe NumberGame do
  it { is_expected.to respond_to(:game_solution, :count) }

  context '#initialize' do
    it 'should be a number 0 - 9' do
      expect(subject.game_solution).to be >= 0
      expect(subject.game_solution).to be < 10
    end

    # ASSIGNMENT
    # Write one test for subject.game_solution that uses 'satisfy' instead of <, >, =
    xit 'should be a number between 0 and 9' do
    end
  end

  context '#correct_guess?' do
    it 'responds with 1 argument' do
      expect(subject).to respond_to(:correct_guess?).with(1).arguments
    end

    context 'when number is correct' do
      it 'should return true' do
        subject.game_solution = 5
        expect(subject.correct_guess?('5')).to be true
      end
    end

    # ASSIGNMENT
    # Write one test for when subject.game_solution does not equal correct_guess?
    context 'when number is not correct' do
      xit 'should return false' do
      end
    end
  end

  context '#verify_input' do
    # ASSIGNMENT
    # Write one test that shows subject will respond to verify_input with 1 argument
    xit 'responds with 1 argument' do
    end

    # The method that asks for 'player_input' is not tested because it is unneccessary to test methods that only contain puts and/or gets.
    # The player_input is used in the game as an argument passed into the verify_input method.
    # Note: this recursive method will repeat until a valid argument is given, due to a regex check.
    context 'when given a valid input as argument' do
      it 'should return valid input' do
        expect(subject.verify_input('3')).to eq('3')
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
        phrase = "LUCKY GUESS!\n"
        expect { subject.game_over }.to output(phrase).to_stdout
      end
    end

    # ASSIGNMENT
    context 'when count is 2-3' do
      xit 'should output correct phrase' do
        subject.count = 3
        phrase = "Congratulations! You picked the random number in 3 guesses!\n"
        # Write the expect statement for this test
        phrase # Use phrase variable
      end
    end

    # ASSIGNMENT
    context 'when count is 4 and over' do
      xit 'should output correct phrase' do
        # Write the conditions to make this test pass
        expect { subject.game_over }.to output(phrase).to_stdout
      end
    end
  end
end
# rubocop:enable Layout/LineLength, Metrics/BlockLength
