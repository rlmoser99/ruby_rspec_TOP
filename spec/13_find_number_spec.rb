# frozen_string_literal: true

require_relative '../lib/13_find_number'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# Let's take a look at test-driven development (TDD) technique called mocking.
# Mocking uses a 'double', which is a generic ruby object.
# Doubles are strict, which means you must specify (allow) any messages that it can receive.
# If the double receives a message that has not been allowed, it will trigger an error.

# Doubles are useful in TDD because you can create test functionality that is not coded yet.

# https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/basics/test-doubles

# In this file, we will be testing the 'FindNumber' class.
# An instance of 'FindNumber' is initialized with a 'RandomNumber' object.
# Since we have not written the 'RandomNumber' class, we will use a double to 'mock' it.

# Doubles are used in many different ways - Dummy, Fake, Stubs, Spies, Mocks
# https://martinfowler.com/bliki/TestDouble.html

describe FindNumber do
  # There are two ways to specify the messages that a double can receive.

  describe '#initialize' do
    # This first example creates the double, then allows specific methods.
    context 'when creating the double and allowing method(s) in two steps' do
      let(:random_number) { double('random_number') }
      subject { described_class.new(0, 9, random_number) }

      it 'should be 8' do
        allow(random_number).to receive(:value).and_return(8)
        expect(subject.answer.value).to eq(8)
      end
    end

    # This second example creates the double and specific methods at the same time.
    context 'when creating the double and allowing method(s) in one step' do
      # A hash can be used to define allowed messages and return values
      # However, when passing a hash as the last argument, the { } are not required.
      # let(:random_number) { double('random_number', { value: 3 }) }
      let(:random_number) { double('random_number', value: 3) }
      subject { described_class.new(0, 9, random_number) }

      it 'should be 3' do
        expect(subject.answer.value).to eq(3)
      end
    end

    # When testing the same method in multiple tests, it is possible to add method names to subject
    context 'when adding method names to subject' do
      let(:random_number) { double('random_number', value: 5) }
      # subject { described_class.new(0, 9, random_number) }
      subject { described_class.new(0, 9, random_number).answer.value }

      it 'should be 3' do
        # expect(subject.answer.value).to eq(5)
        expect(subject).to eq(5)
      end
    end
  end
end

# ASSIGNMENT
# Using these tests, write the code in 'lib/13_find_number' to make these tests pass.

describe FindNumber do
  let(:random_number) { double('random_number', number: 8) }
  subject { described_class.new(0, 9, random_number) }

  describe '#game_over' do
    it 'should be true' do
      allow(random_number).to receive(:number).and_return(8)
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

# Copy to next file(s)
# Changed random_number.number to random_number.value!!! Check for consistency.

# rubocop:enable Layout/LineLength, Metrics/BlockLength
