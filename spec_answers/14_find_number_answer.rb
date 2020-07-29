# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

# All answers for this TDD example are in this file
# (FindNumber class and rspec tests )

# class for computer to find random number
class FindNumber
  attr_reader :answer, :min, :max

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
    @guess < answer.value ? @min = @guess + 1 : @max = @guess - 1
  end
end

# For this assignment you will be doing TDD for 3 methods: #make_guess,
# #make_guess, and #update_range.

# After you have some experience using TDD, you can use the typical
# Red-Green-Refactor workflow.
# https://thoughtbot.com/upcase/videos/red-green-refactor-by-example

# Since this is probably your first experience with TDD, let's extend the
# workflow to include a few more steps:
# 1. Read & understand the requirement for one method only.
# 2. Write one test for that method that you think it will pass.
# 3. Write the method to fulfill the requirement.
# 4. Run the test that you wrote. If it doesn't pass, re-do steps 1-3.
# 5. When your first test is passing, write the additional tests.
# 6. Run all of the tests. If any do not pass, re-do steps 3-5.
# 7. Optional: Refactor your code and/or tests, keeping all tests passing.

describe FindNumber do
  # ASSIGNMENT: METHOD #1

  # The basic idea of 'FindNumber' is to program a computer to guess a
  # random_number using binary search. Remember the binary search video
  # that you watched in the Computer Science section:
  # https://www.youtube.com/watch?v=T98PIp4omUA

  # The computer will update min and max values to help find the correct number.

  describe '#make_guess' do
    # Create a random_number double & allow it to receive 'value' and return any
    # number between 0 and 9, in one of the two ways explained above.

    let(:random_number) { double('random_number', value: 8) }
    subject(:game) { described_class.new(0, 9, random_number) }

    # Write a test that would expect #make_guess to return the middle number of
    # the min and max values (rounded down).
    context 'when min is 0 and max is 9' do
      it 'returns 4' do
        guess = game.make_guess
        expect(guess).to eq(4)
      end
    end

    # Write a method in 14_find_number.rb called #make_guess that returns the
    # average of the min and max values (rounded down).

    # Write a test for each of the following contexts:

    context 'when min is 5 and max is 9' do
      it 'returns 7' do
        game.instance_variable_set(:@min, 5)
        guess = game.make_guess
        expect(guess).to eq(7)
      end
    end

    context 'when min is 8 and max is 9' do
      it 'returns 8' do
        game.instance_variable_set(:@min, 8)
        guess = game.make_guess
        expect(guess).to eq(8)
      end
    end

    context 'when min is 0 and max is 3' do
      it 'returns 1' do
        game.instance_variable_set(:@max, 3)
        guess = game.make_guess
        expect(guess).to eq(1)
      end
    end

    context 'when min and max both equal 3' do
      it 'returns 3' do
        game.instance_variable_set(:@min, 3)
        game.instance_variable_set(:@max, 3)
        guess = game.make_guess
        expect(guess).to eq(3)
      end
    end
  end

  # ASSIGNMENT: METHOD #2
  describe '#game_over?' do
    # In a long test file, it can be helpful to declare variables in each
    # describe block, to make the tests more readable. When creating another
    # instance of the random number and/or subject, use a meaningful name to
    # differentiate between instances.

    # Create a subject and random_number double with a meaningful name.
    # A helpful tip is to combine the purpose of the test and the object.
    # E.g., ending_number & ending_game or completing_random & completing_game.

    # Allow the double to receive 'value' and return a number from the min-max.

    let(:ending_number) { double('random_number', value: 3) }
    subject(:ending_game) { described_class.new(0, 9, ending_number) }

    # Write a test that would expect game to be_game_over when a guess equals
    # the random_number double's value above.

    context 'when guess and random_number are equal' do
      it 'is game over' do
        ending_game.instance_variable_set(:@guess, 3)
        expect(ending_game).to be_game_over
      end
    end

    # Write a method in 14_find_number.rb called #game_over? that returns true
    # when a guess equals the value of the random_number.

    # Write a test that would expect game to NOT be_game_over when a guess does
    # NOT equal the random_number double's value above.

    context 'when guess and random_number are not equal' do
      it 'is not game over' do
        ending_game.instance_variable_set(:@guess, 4)
        expect(ending_game).to_not be_game_over
      end
    end
  end

  # ASSIGNMENT: METHOD #3
  describe '#update_range' do
    let(:updating_number) { double('random_number', value: 8) }
    subject(:updating_game) { described_class.new(0, 9, updating_number) }

    # Write four tests for #update_range that test the values of min and max.

    # When the guess is less than the answer:
    # - min updates to one more than the guess
    # - max stays the same

    # When the guess is more than the answer:
    # - min stays the same
    # - max updates to one less than the guess

    # Note: updating_game in each context block starts off with
    # min = 0 and max = 9.

    context 'when the guess is less than the answer' do
      before do
        updating_game.instance_variable_set(:@guess, 4)
        updating_game.update_range
      end

      it 'updates min' do
        minimum = updating_game.min
        expect(minimum).to eq(5)
      end

      it 'does not update max' do
        maximum = updating_game.max
        expect(maximum).to eq(9)
      end
    end

    context 'when the guess is more than the answer' do
      before do
        updating_game.instance_variable_set(:@guess, 9)
        updating_game.update_range
      end

      it 'does not update min' do
        minimum = updating_game.min
        expect(minimum).to eq(0)
      end

      it 'updates max' do
        maximum = updating_game.max
        expect(maximum).to eq(8)
      end
    end

    # Now, write the method in 14_find_number.rb called #update_range that will
    # do the following:

    # When the guess is less than the answer:
    # - min updates to one more than the guess

    # When the guess is not less than the answer:
    # - max updates to one less than the guess

    # Write a test for any 'edge cases' that you can think of, for example:

    context 'when the guess is 7, with min=5 and max=8' do
      before do
        updating_game.instance_variable_set(:@min, 5)
        updating_game.instance_variable_set(:@max, 8)
        updating_game.instance_variable_set(:@guess, 7)
        updating_game.update_range
      end

      it 'updates min to the same value as max' do
        minimum = updating_game.min
        expect(minimum).to eq(8)
      end

      it 'does not update max' do
        maximum = updating_game.max
        expect(maximum).to eq(8)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
