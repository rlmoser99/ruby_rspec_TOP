# frozen_string_literal: true

# In a typical work-flow, the class being tested will be located in a different file.
# But for this simple example, let's keep everything together.
class RandomNumber
  attr_accessor :number

  def initialize
    @number = rand(1..5)
  end
end

describe RandomNumber do
  # Comparison matchers are self explanatory
  # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/comparison-matchers

  # The can be multiple tests in one example block
  it 'should be greater then 0 and less then 6' do
    expect(subject.number).to be > 0
    expect(subject.number).to be < 6
  end

  context 'when tests can be compounded' do
    it 'should be greater then 0 and less then 6' do
      expect(subject.number).to (be > 0).and be < 6
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

# WIP
# ASSIGNMENT

describe RandomNumber do
  # Have subject be a certain number. Test for it to be greater then 0 and be even
  #
  # expect(subject).not_to be_zero

  # context 'when tests can be compounded' do
  #   it 'should be greater then 0 and less then 6' do
  #     expect(subject.number).to (be > 0).and be < 6
  #   end
  # end

  # it 'should not equal 6' do
  #   expect(subject.number).not_to eq(6)
  # end
end
