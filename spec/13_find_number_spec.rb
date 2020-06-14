# frozen_string_literal: true

require_relative '../lib/13_find_number'

# DIVIDE EACH SECTION INTO THEIR OWN FILE, WITH ACTUAL METHOD EVALVING

# Mocking is a technique used in test-driven development (TDD).
# Mocking creates a fake object or method 'double' that does not exist.

describe FindNumber do
  # random_number is simple double, which is a plain ruby object
  # let(:random_number) { double }
  # An identifier is optional, but is helpful with debugging and inspecting.
  let(:random_number) { double('random_number') }
  subject { described_class.new(0, 9, random_number) }

  describe '#game_over' do
    it 'should be true' do
      # Adding a 'fake' method to random_number is called method stubbing
      allow(random_number).to receive(:number).and_return(8)
      subject.guess = 8
      expect(subject.game_over?).to be true
    end
  end
end

describe FindNumber do
  # Use a 'strict double' to explicitly define the methods that can be used.
  # Example, uses an identifier and hash of method names and return values.
  # let(:random_number) { double('random_number', { number: 8 }) }
  # However, when passing a hash as the last argument, the { } are not required.
  let(:random_number) { double('random_number', number: 8) }
  subject { described_class.new(0, 9, random_number) }

  describe '#game_over' do
    it 'should be false' do
      subject.guess = 5
      expect(subject.game_over?).to be false
    end
  end
end

# After the 'double' object or method is written, the test should be updated.
# Using a 'verifying double' instead of a normal 'double' is preferred.
# A verifying double will give an error if does not exist on the actual class.
# https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles

# It is common for method and variable names to change during development.
# For example, random_number.number could change to random_number.value
# Therefore, using a 'verifying double' makes a test more stable.

describe FindNumber do
  # https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles/using-an-instance-double
  let(:random_number) { instance_double(RandomNumber, number: 8) }
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

describe FindNumber do
  let(:random_number) { instance_double(RandomNumber, number: 8) }
  subject { described_class.new(0, 9, random_number) }

  describe '#computer_guess' do
    it 'should guess until equals 8' do
      subject.computer_guess
      expect(subject.guess).to eq(8)
    end
  end
end

# Unit testing will rely on different types of DOUBLES???.
# The reason why we don’t use the real object is isolation —
# we want to isolate the object under test from the rest of the world,
# the rest of the world being the objects it depends on in this case.

# Three stages to consider when writing a test:
# Arrange ->
# Act ->
# Assert ->
