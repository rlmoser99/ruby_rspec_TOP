# frozen_string_literal: true

# class for computer to find random number
class FindNumber
  attr_accessor :answer, :min, :max, :guess

  def initialize(min, max, answer = RandomNumber.new(min, max))
    @min = min
    @max = max
    @answer = answer
  end

  def make_guess
    (min + max) / 2
  end

  def game_over?
    @guess == answer.value
  end

  def update_range
    guess < answer.value ? @min = guess + 1 : @max = guess - 1
  end
end

describe FindNumber do
  let(:random_number) { double('random_number', value: 8) }
  subject { described_class.new(0, 9, random_number) }

  describe '#make_guess' do
    context 'when min is 0 and max is 9' do
      it 'should be 4' do
        guess = subject.make_guess
        expect(guess).to eq(4)
      end
    end

    context 'when min is 5 and max is 9' do
      it 'should be 7' do
        subject.min = 5
        guess = subject.make_guess
        expect(guess).to eq(7)
      end
    end

    context 'when min is 8 and max is 9' do
      it 'should be 8' do
        subject.min = 8
        guess = subject.make_guess
        expect(guess).to eq(8)
      end
    end

    context 'when min is 0 and max is 3' do
      it 'should be 1' do
        subject.max = 3
        guess = subject.make_guess
        expect(guess).to eq(1)
      end
    end

    context 'when min and max both equal 3' do
      it 'should be 3' do
        subject.min = 3
        subject.max = 3
        guess = subject.make_guess
        expect(guess).to eq(3)
      end
    end
  end

  describe '#game_over?' do
    context 'when guess is 8 and random_number.value is 8' do
      it 'should be true' do
        subject.guess = 8
        game_over = subject.game_over?
        expect(game_over).to be true
      end
    end

    context 'when guess is 4 and random_number.value is 8' do
      it 'should be false' do
        subject.guess = 4
        game_over = subject.game_over?
        expect(game_over).to be false
      end
    end
  end

  describe '#update_range' do
    it 'should only update min' do
      subject.guess = 4
      subject.update_range
      expect(subject.min).to eq(5)
      expect(subject.max).to eq(9)
    end

    it 'should only update max' do
      subject.guess = 9
      subject.update_range
      expect(subject.min).to eq(0)
      expect(subject.max).to eq(8)
    end
  end
end
