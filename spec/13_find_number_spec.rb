# frozen_string_literal: true

require_relative '../lib/13_find_number'

describe FindNumber do
  let(:random_number) { double('random', number: 8) }
  subject { described_class.new(0, 9, random_number) }

  context '#game_over' do
    it 'should be true' do
      subject.guess = 8
      expect(subject.game_over?).to be true
    end

    it 'should be false' do
      subject.guess = 5
      expect(subject.game_over?).to be false
    end
  end
end
