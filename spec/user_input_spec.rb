# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength, Layout/LineLength

require_relative '../lib/user_input'

# Ruby code that was written before you learned how to use rpsec, may be nearly impossible to test.
# For example, in the user_input file, there is a game called ImpossibleTestGame.
# It is the exact same game as NumberGame, which is much easier to test.

# The difference is that NumberGame has smaller, isolated methods that are easier to test.
# Therefore, look at refactoring your method(s) if you don't know how to test them.

# It is unneccessary to write tests for methods that only contain puts statements.
# There is an example below, but puts is a basic part of the standard ruby library & is already well tested.
# In addition, most real world applications don't even output like that except to loggers.

describe NumberGame do
  it { is_expected.to respond_to(:game_solution, :count) }

  context '#initialize' do
    it 'should be a number 0 - 9' do
      expect(subject.game_solution).to be >= 0
      expect(subject.game_solution).to be < 10
    end

    # same test as above, but using satisfy
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

    context 'when given a valid input as argument' do
      it 'should return valid input' do
        expect(subject.verify_input('3')).to eq('3')
      end
    end
  end

  context '#game_over' do
    context 'when count is 1' do
      it 'should output correct phrase' do
        subject.count = 1
        phrase = "LUCKY GUESS!\n"
        expect { subject.game_over }.to output(phrase).to_stdout
      end
    end

    context 'when count is 3' do
      it 'should output correct phrase' do
        subject.count = 3
        phrase = "Congratulations! You picked the random number in 3 guesses!\n"
        expect { subject.game_over }.to output(phrase).to_stdout
      end
    end

    context 'when count is 7' do
      it 'should output correct phrase' do
        subject.count = 7
        phrase = "That was hard. It took you 7 guesses!\n"
        expect { subject.game_over }.to output(phrase).to_stdout
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength, Layout/LineLength
