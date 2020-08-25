# frozen_string_literal: true

# All answers for this TDD example are in this file
# (FindNumber class and rspec tests )

# class for computer to find random number
class FindNumber
  attr_reader :min, :max, :answer, :guess

  def initialize(min, max, answer = RandomNumber.new(min, max), guess = nil)
    @min = min
    @max = max
    @answer = answer.value
    @guess = guess
  end

  def make_guess
    @guess = (min + max) / 2
  end

  def game_over?
    guess == answer
  end

  def update_range
    guess < answer ? @min = guess + 1 : @max = guess - 1
  end
end

# For this lesson you will be doing TDD for 3 methods: #make_guess,
# #make_guess, and #update_range.

# After you have some experience using TDD, you can use the typical
# Red-Green-Refactor workflow.
# https://thoughtbot.com/upcase/videos/red-green-refactor-by-example

# Since this is probably your first experience with TDD, let's extend the
# workflow to include a few more steps:
# 1. Read & understand the requirement for one method only.
# 2. Write one test for that method; run the tests to see it fail.
# 3. Write the method to fulfill the requirement.
# 4. Run the tests again. If they don't all pass, redos steps 1-3.
# 5. When your first test is passing, write the additional tests.
# 6. Run all of the tests. If any do not pass, redo steps 3-5.
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

    # Before you write the #make_guess method:
    # Write a test that would expect #make_guess to return the average of
    # the min and max values (rounded down). Don't expect this test to be
    # able to pass as you haven't written #make_guess yet!
    context 'when min is 0 and max is 9' do
      it 'returns 4' do
        guess = game.make_guess
        expect(guess).to eq(4)
      end
    end

    # Now write a method in 14_find_number.rb called #make_guess that returns
    # the average of the min and max values (rounded down).
    # You can now run the above test and it should pass.

    # Write a test for each of the following contexts:

    context 'when min is 5 and max is 9' do
      subject(:game_five) { described_class.new(5, 9, random_number) }

      it 'returns 7' do
        guess = game_five.make_guess
        expect(guess).to eq(7)
      end
    end

    context 'when min is 8 and max is 9' do
      subject(:game_eight) { described_class.new(8, 9, random_number) }

      it 'returns 8' do
        guess = game_eight.make_guess
        expect(guess).to eq(8)
      end
    end

    context 'when min is 0 and max is 3' do
      subject(:game_zero) { described_class.new(0, 3, random_number) }

      it 'returns 1' do
        guess = game_zero.make_guess
        expect(guess).to eq(1)
      end
    end

    context 'when min and max both equal 3' do
      subject(:game_three) { described_class.new(3, 3, random_number) }

      it 'returns 3' do
        guess = game_three.make_guess
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

    # Create a subject and random_number double with meaningful names.
    # A helpful tip is to combine the purpose of the test and the object.
    # E.g., ending_number & ending_game or completing_random & completing_game.

    # Allow the double to receive 'value' and return a number from 0 to 9.

    # Write a test that would expect game to be_game_over when a guess equals
    # the random_number double's value above. Remember that this test will not
    # be able to pass yet because you haven't written the method!

    context 'when guess and random_number are equal' do
      let(:ending_number) { double('random_number', value: 3) }
      subject(:ending_game) { described_class.new(0, 9, ending_number, 3) }

      it 'is game over' do
        expect(ending_game).to be_game_over
      end
    end

    # Write the corresponding method in 14_find_number.rb called #game_over?
    # that returns true when a guess equals the value of the random_number.

    # Write a test that would expect game to NOT be_game_over when a guess does
    # NOT equal the random_number double's value above.

    context 'when guess and random_number are not equal' do
      let(:mid_number) { double('random_number', value: 5) }
      subject(:mid_game) { described_class.new(0, 9, mid_number, 4) }

      it 'is not game over' do
        expect(mid_game).to_not be_game_over
      end
    end
  end

  # ASSIGNMENT: METHOD #3
  describe '#update_range' do
    # If you share the same random_number double for both multiple context
    # blocks, you can declare it inside the describe block.
    let(:range_number) { double('random_number', value: 8) }

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
      subject(:low_guess_game) { described_class.new(0, 9, range_number, 4) }

      before do
        low_guess_game.update_range
      end

      it 'updates min' do
        minimum = low_guess_game.min
        expect(minimum).to eq(5)
      end

      it 'does not update max' do
        maximum = low_guess_game.max
        expect(maximum).to eq(9)
      end
    end

    context 'when the guess is more than the answer' do
      subject(:high_guess_game) { described_class.new(0, 9, range_number, 9) }

      before do
        high_guess_game.update_range
      end

      it 'does not update min' do
        minimum = high_guess_game.min
        expect(minimum).to eq(0)
      end

      it 'updates max' do
        maximum = high_guess_game.max
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
      subject(:eight_game) { described_class.new(5, 8, range_number, 7) }

      before do
        eight_game.update_range
      end

      it 'updates min to the same value as max' do
        minimum = eight_game.min
        expect(minimum).to eq(8)
      end

      it 'does not update max' do
        maximum = eight_game.max
        expect(maximum).to eq(8)
      end
    end
  end
end
