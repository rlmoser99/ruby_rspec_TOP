# frozen_string_literal: true

require_relative '../lib/13_find_number'

describe FindNumber do
  let(:random_number) { double('random', number: 8) }
  subject { described_class.new(0, 9, random_number) }

  describe '#game_over' do
    it 'should be true' do
      subject.guess = 8
      expect(subject.game_over?).to be true
    end

    it 'should be false' do
      subject.guess = 5
      expect(subject.game_over?).to be false
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
