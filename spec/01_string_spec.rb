# frozen_string_literal: true

# rubocop:disable Layout/LineLength

describe String do
  # The let method is passed a block that computes the value of the variable.
  # It will only be called when the variable is needed (known as: lazy loading)
  let(:favorite_color) { String.new('blue') }

  # Use a context block to make your tests clear and well organized.
  # It is not required, but it is generally used to explain any conditionals
  # should start with words like: if, when, unless, with, without, for, before, after, during
  context 'when let variable is used' do
    it 'should be the value of assigned let variable' do
      expect(favorite_color).to eq('blue')
    end
  end

  context 'when let variables values change inside an example' do
    it 'should be the updated value of the let variable' do
      expect(favorite_color).to eq('blue')
      favorite_color = 'navy blue'
      expect(favorite_color).to eq('navy blue')
    end

    # let variables re-set between examples
    it 'should be value of variable assigned' do
      expect(favorite_color).to eq('blue')
    end
  end
end

# ASSIGNMENT

describe String do
  # Create a let variable that will pass the first test.

  # remove the 'x' before running this test
  xit 'should equal tacos' do
    expect(favorite_food).to eq('tacos')
  end

  # remove the 'x' before running this test
  context 'when favorite_food is updated' do
    xit 'should equal your favorite food' do
      # Change the favorite_food let variable
      # Write a test that will pass
    end
  end
end

# rubocop:enable Layout/LineLength
