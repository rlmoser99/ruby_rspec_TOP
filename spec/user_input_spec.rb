# frozen_string_literal: true

require_relative '../lib/user_input'

describe NumberGame do
  context '#initialize' do
    it 'should be a number 0 - 9' do
      expect(subject.game_solution).to be >= 0
      expect(subject.game_solution).to be < 10
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
  # WHY DID I DUPLICATE THESE TESTS???
  # context '#correct_guess?' do
  #   context 'when number is correct' do
  #     it 'should return true' do
  #       subject.game_solution = 5
  #       expect(subject.correct_guess?('5')).to be true
  #     end
  #   end
  #   context 'when number is not correct' do
  #     it 'should return false' do
  #       subject.game_solution = 5
  #       expect(subject.correct_guess?('2')).to be false
  #     end
  #   end
  # end
  context '#verify_input' do
    context 'when provided with a valid input' do
      it 'should return valid input' do
        expect(subject.verify_input('3')).to eq('3')
      end
    end
  end
  context '#game_over' do
    context 'when count is 1' do
      it 'should output phrase' do
        subject.count = 1
        result = "LUCKY GUESS!\n"
        expect { subject.game_over }.to output(result).to_stdout
      end
    end
    context 'when count is 3' do
      it 'should output phrase' do
        subject.count = 3
        result = "Congratulations! You picked the random number in 3 guesses!\n"
        expect { subject.game_over }.to output(result).to_stdout
      end
    end
    context 'when count is 7' do
      it 'should output phrase' do
        subject.count = 7
        result = "That was hard. It took you 7 guesses!\n"
        expect { subject.game_over }.to output(result).to_stdout
      end
    end
  end
end
