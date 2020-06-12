# frozen_string_literal: true

require_relative '../lib/12_input_output'

# Ruby code that was written before you learned how to use rpsec, may be nearly impossible to test.
# For example, in the 12_input_output file, there are two identical games - ImpossibleTestGame and NumberGame.
# Take a look at both games and look for the differences that may make it easier or harder to test.

# One key difference is that NumberGame has smaller, isolated methods.

# Small and isolated methods that only do one thing are easy to test.
# Long methods are like a run-on sentence because it all can go together and make sense to be in one place together, but because it accomplished many different tasks, it is difficult to test because that one method could have many different scenerios that need to be created in order to have good test coverage of all the possibilities that could happen.

# Therefore, if you are new to testing, be open to refactoring your previous code to make writing testing easier.
# As you learn testing, you are also learning how to write better testable methods.

describe NumberGame do
  it { is_expected.to respond_to(:game_solution, :count) }

  context '#initialize' do
    it 'should be a number 0 - 9' do
      expect(subject.game_solution).to be >= 0
      expect(subject.game_solution).to be < 10
    end

    # ASSIGNMENT?
    it 'should be a number between 0 and 9' do
      expect(subject.game_solution).to satisfy do |number|
        number.between?(0, 9)
      end
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

    # ASSIGNMENT?
    context 'when number is not correct' do
      it 'should return false' do
        subject.game_solution = 5
        expect(subject.correct_guess?('2')).to be false
      end
    end
  end

  context '#verify_input' do
    it 'responds with 1 argument' do
      expect(subject).to respond_to(:verify_input).with(1).arguments
    end

    # This recursive method will repeat until a valid argument is given.
    context 'when given a valid input as argument' do
      it 'should return valid input' do
        expect(subject.verify_input('3')).to eq('3')
      end
    end
  end

  # It is unneccessary to write tests for methods that only contain puts statements, like #game_over.
  # Puts is a basic part of the standard ruby library & is already well tested. Plus, most 'real world applications' don't even output like this except to loggers.

  # However, here is an example of how you can test it using the output matcher
  # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/output-matcher

  context '#game_over' do
    context 'when count is 1' do
      it 'should output correct phrase' do
        subject.count = 1
        phrase = "LUCKY GUESS!\n"
        expect { subject.game_over }.to output(phrase).to_stdout
      end
    end

    # ASSIGNMENT?
    context 'when count is 3' do
      it 'should output correct phrase' do
        subject.count = 3
        phrase = "Congratulations! You picked the random number in 3 guesses!\n"
        expect { subject.game_over }.to output(phrase).to_stdout
      end
    end

    # ASSIGNMENT?
    context 'when count is 7' do
      it 'should output correct phrase' do
        subject.count = 7
        phrase = "That was hard. It took you 7 guesses!\n"
        expect { subject.game_over }.to output(phrase).to_stdout
      end
    end
  end
end
# rubocop:enable
