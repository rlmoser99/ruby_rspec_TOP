# frozen_string_literal: true

require_relative '../lib/15_binary_search'
require_relative '../lib/15_random_number'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# This file is a 'Work In Progress'

# The files for this example (#15) builds on the TDD files from #14.
# The FindNumber class is now called BinarySearch, which is a more accurate description.

# After TDD is complete, the classes and methods that were used as a test double, should be updated to a 'verifying double'
# Using a 'verifying double' is preferred, because they will produce an error if does not exist on the actual class.
# https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles

# It is common for method and variable names to change during development (random_number.value could change to rand_num.number)
# Therefore, using a 'verifying double' makes a test more stable.

# Unit testing relies on using doubles, because the test needs to isolate the object from the rest of the application.
# This is polymorphism

# Polumorphism Concept:
# The movie class shouldn't care if it is given an actual class object, but rather all it cares is that it is given an object that can respond to certain methods (polymorphism).
# we shouldn't worry about about kind of object is, but what is can respond to...

# Something that sleeps(3) to show test time saving (database lookup)

describe BinarySearch do
  describe '#make_guess' do
    subject(:game) { described_class.new(0, 9, random_number) }
    # A class called RandomNumber now exists, therefore update the previous 'double' to an 'instance_double' which is a verifying double
    # https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles/using-an-instance-double
    let(:random_number) { instance_double('random_number', value: 8) }

    context 'when min is 0 and max is 9' do
      xit 'should be 4' do
        guess = game.make_guess
        expect(guess).to eq(4)
      end
    end

    context 'when min is 5 and max is 9' do
      xit 'should be 7' do
        game.min = 5
        guess = game.make_guess
        expect(guess).to eq(7)
      end
    end

    context 'when min is 8 and max is 9' do
      xit 'should be 8' do
        game.min = 8
        guess = game.make_guess
        expect(guess).to eq(8)
      end
    end

    context 'when min is 0 and max is 3' do
      xit 'should be 1' do
        game.max = 3
        guess = game.make_guess
        expect(guess).to eq(1)
      end
    end

    context 'when min and max both equal 3' do
      xit 'should be 3' do
        game.min = 3
        game.max = 3
        guess = game.make_guess
        expect(guess).to eq(3)
      end
    end
  end

  describe '#game_over?' do
    let(:random_number) { instance_double('random_number', value: 3) }
    subject(:game) { described_class.new(0, 9, random_number) }

    context 'when guess and random_number.value equal' do
      it 'should be game over' do
        game.guess = 3
        expect(game).to be_game_over
      end
    end

    context 'when guess and random_number.value is not equal' do
      it 'should not be game over' do
        game.guess = 4
        expect(game).to_not be_game_over
      end
    end
  end

  describe '#update_range' do
    let(:random_number) { instance_double('random_number', value: 8) }
    subject(:game) { described_class.new(0, 9, random_number) }

    context 'when the guess is 4' do
      it 'should only update min' do
        game.guess = 4
        game.update_range
        minimum = game.min
        maximum = game.max
        expect(minimum).to eq(5)
        expect(maximum).to eq(9)
      end
    end

    context 'when the guess is 9' do
      it 'should only update max' do
        game.guess = 9
        game.update_range
        minimum = game.min
        maximum = game.max
        expect(minimum).to eq(0)
        expect(maximum).to eq(8)
      end
    end

    context 'when the guess is 7, with min=5 and max=8' do
      it 'should update min to the same value as max' do
        game.min = 5
        game.max = 8
        game.guess = 7
        game.update_range
        minimum = game.min
        maximum = game.max
        expect(minimum).to eq(8)
        expect(maximum).to eq(8)
      end
    end
  end
end

describe BinarySearch do
  let(:random_number) { instance_double(RandomNumber, value: 8) }
  subject { described_class.new(0, 9, random_number) }

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

# This #make_guess method takes a long time to complete.
# By providing the return values to test, the time of the test is shortened.
# Do an example with and without this change.
describe BinarySearch do
  let(:random_number) { instance_double(RandomNumber, value: 8) }
  subject { described_class.new(0, 9, random_number) }

  describe '#computer_guess' do
    xit 'should guess until equals 8' do
      allow(subject).to receive(:make_guess).and_return(4, 7, 8)
      # These 3 lines remove the puts statement that happens during test.
      # allow(subject).to receive(:display_guess).with(1)
      # allow(subject).to receive(:display_guess).with(2)
      # allow(subject).to receive(:display_guess).with(3)
      subject.computer_guess
      expect(subject.guess).to eq(8)
    end
  end
end

# rubocop:enable Layout/LineLength, Metrics/BlockLength
