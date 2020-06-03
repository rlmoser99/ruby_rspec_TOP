# frozen_string_literal: true

# rubocop:disable Layout/LineLength
describe String do
  # The let method is passed a block that computes the value of the variable.
  # It will be called if the value of the variable when needed (known as: lazy loading)
  let(:favorite_color) { String.new('blue') }

  # Use a context block make your tests clear and well organized, but it is not required.
  # it is used to make your explain any conditionals
  # should start with words like: if, when, unless, with, without, for, before, after, during
  context 'when let variable is used' do
    it 'should be value of variable assigned' do
      expect(favorite_color).to eq('blue')
    end
  end

  context 'when let variables values change inside an example' do
    it 'should be new updated value ' do
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
  # Make a let variable that will pass the first test.
  let(:favorite_food) { String.new('tacos') } # REMOVE

  # remove the 'x' before running this test
  xit 'should equal tacos' do
    expect(favorite_food).to eq('tacos')
  end

  # remove the 'x' before running this test
  xit 'should equal your favorite food' do
    # Change the favorite_food variable
    favorite_food = 'fajitas' # REMOVE
    # Write a test that will pass
    expect(favorite_food).to eq('fajitas') # REMOVE
  end
end
# rubocop:enable Layout/LineLength
