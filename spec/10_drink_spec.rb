# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# Now that the basics are covered, we are going to use a typical work-flow.
# The class being tested will be located in a different file:
require_relative '../lib/10_drink'
# If you are using VS Code, you can split the screen to see both files. (view menu -> editor layout)

# In addition, we are going to start using Arrange-Act-Assert to format each test.
# http://www.chrisrolle.com/en/blog/testing-arrange-act-assert
# https://youtu.be/sCthIEOaMI8

# 1. Arrange -> set-up the test (for example: initializing objects, let variables, updating values of instance variables, etc.)
# 2. Act -> executing the logic to test (for example: calling a method to run)
# 3. Assert -> expect the results of arrange & act

# Warning: When you start using A-A-A to format your tests, it can feel counter-intuitive to DRY (don't repeat yourself)
# Using repetition is unavoidable in read-able tests, which is the project's 'living documention' and should be very explicit.

describe Drink do
  # The Drink class needs to have an attr_reader for :type
  context 'when using default initialization' do
    # Arrange
    subject(:my_drink) { Drink.new }
    it 'should be water' do
      # Act
      drink_type = my_drink.type
      # Assert
      expect(drink_type).to eq('water')
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
    subject(:my_drink) { described_class.new('juice') }
    it 'should be juice' do
      expect(my_drink.type).to eq('juice')
    end
  end
end

# ASSIGNMENT

describe Drink do
  # For both contexts, write a subject & 2 tests that expresses each of the following statements

  context 'when my drink is new' do
    # remove the 'x' before running this test
    xit 'should have 16 ounces' do
    end

    # remove the 'x' before running this test
    xit 'should be full' do
    end
  end

  context 'when my drink only has 12 ounces' do
    # remove the 'x' before running this test
    xit 'should have 12 ounces' do
    end

    # remove the 'x' before running this test
    xit 'should not be full' do
    end
  end
end

# rubocop:enable Layout/LineLength
