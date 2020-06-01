# frozen_string_literal: true

require_relative '../lib/user_input'

describe NumberGame do
  it { is_expected.to respond_to(:game_solution, :count) }
  context '#initialize' do
    it 'should be a number 0 - 9' do
      expect(subject.game_solution).to be >= 0
      expect(subject.game_solution).to be < 10
    end
    it 'should be a number between 0 and 9' do
      # rubocop error:
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
