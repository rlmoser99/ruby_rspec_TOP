# frozen_string_literal: true

require_relative '../lib/14_find_number'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# Let's take a look at test-driven development (TDD) technique of using a 'double'.
# A 'double' is a generic ruby object, that stands in for the real object, like a stunt-double.

# Doubles are very useful in TDD because you can create test functionality that is not coded yet.

# In this example, we will testing the class 'FindNumber'. Look at the lib/14_find_number.rb file.
# An instance of 'FindNumber' is initialized with a 'RandomNumber' object.

# The 'RandomNumber' class has not been written, so we will use a double for it in these tests.
# https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/basics/test-doubles

# Learning about doubles can be very confusing, because many resources use doubles/mocks/stubs interchangably.
# If you want to dig a little deeper, here are a few additional resources to check out:
# https://www.tutorialspoint.com/rspec/rspec_test_doubles.htm
# https://www.codewithjason.com/rspec-mocks-stubs-plain-english/

describe FindNumber do
  # There are two ways to specify the messages that a double can receive.

  describe '#initialize' do
    # Doubles are strict, which means you must specify (allow) any messages that it can receive.
    # If the double receives a message that has not been allowed, it will trigger an error.

    # This first example creates the double, then allows specific methods.
    context 'when creating the double and allowing method(s) in two steps' do
      let(:random_number) { double('random_number') }
      subject(:game) { described_class.new(0, 9, random_number) }

      context 'when random_answer.value is 8' do
        it 'returns 8' do
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
        it 'returns 3' do
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
        it 'returns 5' do
          expect(game_solution).to eq(5)
        end
      end
    end
  end
end

# ASSIGNMENT
# For this assignment you will be doing TDD for 3 methods - '#make_guess, '#make_guess, and #update_range

# After you have some experience using TDD, you can use the typical Red-Green-Refactor workflow.
# https://thoughtbot.com/upcase/videos/red-green-refactor-by-example

# Since this is probably your first experience with TDD, let's extend the workflow to include a few more steps:
# 1. Read & understand the requirement for one method at a time.
# 2. Write one test for that method that you think will pass.
# 3. Write the method that fulfills the requirement.
# 4. Run the test that you wrote. If it doesn't pass, re-do steps 1-3
# 5. When your first test is passing, write the additional tests in the assignment.
# 6. Run all of the tests. If they all don't pass, re-do steps 3-5.
# 7. Optional: Refactor your code and/or tests, making sure to have all tests passing.

describe FindNumber do
  # ASSIGNMENT: METHOD #1

  # The basic idea of 'FindNumber' is to program a computer to guess a random_number, using binary search.
  # Remember the binary search video that you watched in the Computer Science section
  # https://www.youtube.com/watch?v=T98PIp4omUA
  # The computer will update min and max values to help find the correct number.

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
    # When creating another instance of the random number and/or subject, use a different name to differentiate between instances.
    # Create a subject and random_number double & allow it to receive 'value' and return any number from the min - max

    # Write a test that would expect game to be_game_over when a guess equals the random_number double's value above

    context 'when guess and random_number equal' do
    end

    # Write a method in 13_find_number.rb called #game_over? that returns true when a guess equals the value of the random_number

    # Write a test that would expect game to NOT be_game_over when a guess does NOT equal the random_number double's value above

    context 'when guess and random_number does not equal' do
    end
  end

  # ASSIGNMENT: METHOD #3
  describe '#update_range' do
    # When naming different instances of subject or let variables, use meaningful names.
    # This is not the best example, but it is better then naming them 'new_game', 'game2', 'next_number', or 'random_num'
    let(:random_eight) { double('random_number', value: 8) }
    subject(:game_eight) { described_class.new(0, 9, random_eight) }

    # Write a test for #update_range that for each of the following scenerios:
    # 1. If the guess is less than the solution, then the min would update to one more than the guess & max stays the same.
    # 2. If the guess is greater than the solution, then the max would update to one less than the guess & min stays the same.
    # Note: this example game starts off with min = 0 and max = 9 due to the { described_class.new(0, 9, random_eight) }

    context 'when the guess is 4' do
      # When using the same 'Arrange' part of a test, you can utilize before hooks to set-up the test conditions.
      # https://relishapp.com/rspec/rspec-core/v/2-0/docs/hooks/before-and-after-hooks\

      before do
        game_eight.instance_variable_set(:@guess, 4)
        game_eight.update_range
      end

      xit 'updates min' do
      end

      xit 'does not update max' do
      end
    end

    context 'when the guess is 9' do
    end

    # Now, write the method in 13_find_number.rb called #update_range that will do the following:
    # 1. If the guess is less than the solution, then the min would update to one more than the guess
    # 2. If the guess is greater than the solution, then the max would update to one less than the guess

    # Write a test for any 'edge cases' that you can think of, for example:

    context 'when the guess is 7, with min=5 and max=8' do
      xit 'updates min to the same value as max' do
      end

      xit 'does not update max' do
      end
    end
  end
end

# rubocop:enable Layout/LineLength, Metrics/BlockLength
