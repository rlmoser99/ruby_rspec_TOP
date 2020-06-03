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
  it 'should be greater then 0 and less then 6' do
    expect(subject.number).to be > 0
    expect(subject.number).to be < 6
  end

  context 'when tests can be compounded' do
    it 'should be greater then 0 and less then 6' do
      # rubocop produced an error with (be > 0).and be < 6, but works with the following:
      expect(subject.number).to be_positive.and be < 6
    end

    context 'when random number is 3' do
      it 'should be odd and less then 6' do
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
  it 'should be empty' do
    # Write a test that verifies if subject is empty
    expect(subject).to be_empty # REMOVE
  end

  context 'when my_array is perfect' do
    # Write a let variable that passes these
    let(:my_array) { [-7, 42, 101, 98] } # REMOVE

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
    xit 'should have made sense of this double-negative' do
      expect(my_array[3]).not_to be_nil
    end

    # remove the 'x' before running this test
    xit 'should pass this bonus test' do
      expect(my_array).to include(42)
    end
  end
end
# rubocop:enable Layout/LineLength, Metrics/BlockLength
