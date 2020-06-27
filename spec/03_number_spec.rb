# frozen_string_literal: true

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# In a typical work-flow, the class being tested will be located in a different file.
# But for this simple example, let's keep everything together.
class RandomNumber
  attr_accessor :number

  def initialize
    @number = rand(1..5)
  end
end

describe RandomNumber do
  # Comparison matchers are used with 'be' matcher
  # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/comparison-matchers

  # There can be multiple tests in one example block
  it 'should be greater than 0 and less than 6' do
    # Remember 'subject' can be implicitly defined when the outermost example group is a class.
    expect(subject.number).to be >= 1
    expect(subject.number).to be < 6
  end

  context 'when tests can be compounded' do
    it 'should be greater than 0 and less than 6' do
      # side note: rspec would run, but rubocop didnt like (be >= 1).and be < 6
      expect(subject.number).to be_positive.and be < 6
    end

    context 'when random number is 3' do
      it 'should be odd and less than 6' do
        # Note: the number attribute must have a setter method (for example: attr_accessor).
        subject.number = 3
        expect(subject.number).to be_odd.and be < 6
      end
    end
  end

  # Instead of using .to, you can use the inverse built in matcher .not_to
  context 'when using not_to' do
    it 'should not equal 6' do
      expect(subject.number).not_to eq(6)
    end
    it 'should not equal 0' do
      expect(subject.number).not_to be_zero
    end
    it 'should not be nil' do
      expect(subject.number).not_to be_nil
    end
  end
end

# ASSIGNMENT

describe Array do
  xit 'should be empty' do
    # Write a test that verifies if subject is empty
  end

  context 'when my_array has perfect values' do
    # Write a let variable 'my_array' that passes all tests

    # remove the 'x' before running this test
    xit 'should have specific first and last values' do
      expect(my_array.first).to be_odd.and be <= -1
      expect(my_array.last).to be_even.and be < 99
    end

    # remove the 'x' before running this test
    xit 'should have specific min and max values' do
      expect(my_array.min).not_to be < -9
      expect(my_array.max).to be > 100
    end

    # remove the 'x' before running this test
    xit 'should include a value of 42' do
      expect(my_array).to include(42)
    end

    # remove the 'x' before running this test
    xit 'should have at least four values' do
      expect(my_array[3]).not_to be_nil
    end
  end
end
# rubocop:enable Layout/LineLength, Metrics/BlockLength
