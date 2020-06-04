# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# Now that the basics are covered, we are going to use a typical work-flow.
# The class being tested will be located in a different file.
# If you are using VS Code, you can split the screen to see both files. (view menu -> editor layout)
require_relative '../lib/drink'

describe Drink do
  # The Drink class needs to have an attr_reader for :type
  context 'when using default initialization' do
    it 'should be water' do
      expect(subject.type).to eq('water')
    end
  end

  context 'when specifying the type' do
    subject(:my_drink) { Drink.new('coffee') }
    it 'should be coffee' do
      expect(my_drink.type).to eq('coffee')
    end
  end

  context 'when changing the type inside an example' do
    # When changing the type inside an example, the Drink class needs to have an attr_accessor for :type
    subject(:my_drink) { Drink.new('coffee') }
    it 'should change to tea' do
      my_drink.type = 'tea'
      expect(my_drink.type).to eq('tea')
    end
  end

  # Use 'described_class' instead of the class name, to limit the code that will need to be changed if/when it changes.
  # For example, as applications develop, class names are subject to change. Drink could be changed to 'Beverage'.
  context 'when limiting future code changes' do
    subject(:my_drink) { described_class.new('pepsi') }
    it 'should be pepsi' do
      expect(my_drink.type).to eq('pepsi')
    end
  end
end

# ASSIGNMENT

describe Drink do
  # For both contexts, write a subject & 2 tests that expresses each of the following statements

  context 'when my drink is new' do
    subject(:my_drink) { described_class.new('tea') } # REMOVE

    # remove the 'x' before running this test
    xit 'should have 16 ounces' do
      expect(my_drink.ounces).to eq(16) # REMOVE
    end

    # remove the 'x' before running this test
    xit 'should be full' do
      expect(my_drink.full?).to be true # REMOVE
    end
  end

  context 'when my drink only has 12 ounces' do
    subject(:my_drink) { described_class.new('tea', 12) } # REMOVE

    # remove the 'x' before running this test
    xit 'should have 12 ounces' do
      expect(my_drink.ounces).to eq(12) # REMOVE
    end

    # remove the 'x' before running this test
    xit 'should not be full' do
      expect(my_drink.full?).to be false # REMOVE
    end
  end
end

# rubocop:enable Layout/LineLength
