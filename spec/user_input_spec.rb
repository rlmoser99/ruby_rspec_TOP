# frozen_string_literal: true

require_relative '../lib/user_input'

describe NumberGame do
  it { should be_kind_of(NumberGame) }
  context '#initialize' do
    it 'should return number under 10' do
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
  context '#verify_input' do
    context 'when provided with a valid input' do
      it 'should return valid input' do
        expect(subject.verify_input('3')).to eq('3')
      end
    end
  end
end
