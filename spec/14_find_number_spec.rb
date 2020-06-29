# frozen_string_literal: true

require_relative '../lib/14_find_number'

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

# FYI: Doubles are used in many different ways - Dummy, Fake, Stubs, Spies, Mocks
# https://martinfowler.com/bliki/TestDouble.html

describe FindNumber do
  # There are two ways to specify the messages that a double can receive.

  describe '#initialize' do
    # This first example creates the double, then allows specific methods.
    context 'when creating the double and allowing method(s) in two steps' do
      let(:random_number) { double('random_number') }
      subject(:game) { described_class.new(0, 9, random_number) }

      context 'when random_answer.value is 8' do
        it 'is 8' do
          allow(random_number).to receive(:value).and_return(8)
          solution = game.answer.value
          expect(solution).to eq(8)
        end
      end
    end

    # This second example creates the double and specific methods at the same time.
    context 'when creating the double and allowing method(s) in one step' do
      # A hash can be used to define allowed messages and return values
      # However, when passing a hash as the last argument, the { } are not required.
      # let(:random_number) { double('random_number', { value: 3 }) }
      let(:random_number) { double('random_number', value: 3) }
      subject(:game) { described_class.new(0, 9, random_number) }

      context 'when random_answer.value is 3' do
        it 'is 3' do
          solution = game.answer.value
          expect(solution).to eq(3)
        end
      end
    end

    # When testing the same method in multiple tests, it is possible to add method names to subject
    context 'when adding method names to subject for multiple tests' do
      let(:random_number) { double('random_number', value: 5) }
      subject(:game_solution) { described_class.new(0, 9, random_number).answer.value }

      context 'when random_answer.value is 5' do
        it 'is 5' do
          expect(game_solution).to eq(5)
        end
      end
    end
  end
end

# ASSIGNMENT
# This assignment is going to be writing tests & writing code to make those tests pass.

# The basic idea of 'FindNumber' is to program a computer to guess a random_number, using binary search.
# Remember the binary search video that you watched in the Computer Science section
# https://www.youtube.com/watch?v=T98PIp4omUA
# The computer will update min and max values to help find the correct number.

describe FindNumber do
  # ASSIGNMENT: METHOD #1
  describe '#make_guess' do
    subject(:game) { described_class.new(0, 9, random_number) }
    # Create a random_number double & allow it to receive 'value' and return 8 in one of the two ways explained above

    # Write a test that would expect #make_guess to return the middle number of the min and max values (rounded down)
    context 'when min is 0 and max is 9' do
    end

    # Write a method in 13_find_number.rb called #make_guess that returns the middle number of the min and max values

    # Write a test for each of the following contexts:

    context 'when min is 5 and max is 9' do
    end

    context 'when min is 8 and max is 9' do
    end

    context 'when min is 0 and max is 3' do
    end

    context 'when min and max both equal 3' do
    end
  end

  # ASSIGNMENT: METHOD #2
  describe '#game_over?' do
    # In a long test file, it can be helpful to declare variables in each describe block, to make the tests more read-able.
    # So create a subject and random_number double & allow it to receive 'value' and return any number from the min - max

    # Write a test that would expect game to be_game_over when a guess equals the random_number.value above

    context 'when guess and random_number.value equal' do
    end

    # Write a method in 13_find_number.rb called #game_over? that returns true when a guess equals the value of the random_number

    # Write a test that would expect game to NOT be_game_over when a guess does NOT equal the random_number.value above

    context 'when guess and random_number.value does not equal' do
    end
  end

  # ASSIGNMENT: METHOD #3
  describe '#update_range' do
    let(:random_number) { double('random_number', value: 8) }
    subject(:game) { described_class.new(0, 9, random_number) }

    # Write a test for #update_range that for each of the following scenerios:
    # 1. If the guess is less than the solution, then the min would update to one more than the guess & max stays the same.
    # 2. If the guess is greater than the solution, then the max would update to one less than the guess & min stays the same.
    # Note: this example game starts off with min = 0 and max = 9 due to the { described_class.new(0, 9, random_number) }

    context 'when the guess is 4' do
    end

    context 'when the guess is 9' do
    end

    # Now, write the method in 13_find_number.rb called #update_range that will do the following:
    # 1. If the guess is less than the solution, then the min would update to one more than the guess
    # 2. If the guess is greater than the solution, then the max would update to one less than the guess

    # Write a test for any 'edge cases' that you can think of, for example:

    context 'when the guess is 7, with min=5 and max=8' do
    end
  end
end

# rubocop:enable Layout/LineLength, Metrics/BlockLength
