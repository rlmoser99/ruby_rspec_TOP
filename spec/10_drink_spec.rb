# frozen_string_literal: true

# Now that the basics are covered, we are going to use a typical workflow.
# The class being tested will be located in a different file.
# If you are using VS Code, you can split the screen to see both files.
# (view menu -> editor layout)

require_relative '../lib/10_drink'

describe Drink do
  describe '#initialize' do
    # The Drink class needs to have an attr_reader for both :type and :ounces.
    context 'when using default initialization' do
      subject(:default_drink) { Drink.new }

      it 'is water' do
        expect(default_drink.type).to eq('water')
      end

      it 'has 16 ounces' do
        expect(default_drink.ounces).to eq(16)
      end
    end

    context 'when specifying the type and ounces' do
      subject(:my_drink) { Drink.new('coffee', 8) }

      it 'is coffee' do
        expect(my_drink.type).to eq('coffee')
      end

      it 'has 8 ounces' do
        expect(my_drink.ounces).to eq(8)
      end
    end

    context 'when changing the type inside an example' do
      subject(:my_drink) { Drink.new('coffee') }

      it 'changes to tea' do
        # Changing the value of an instance_variable without an attr_accessor.
        my_drink.instance_variable_set(:@type, 'tea')
        expect(my_drink.type).to eq('tea')
      end
    end

    # Use 'described_class' instead of the class name to limit the code that
    # needs to be changed, if/when it changes. For example, as applications
    # develop, class names are subject to change, so that Drink could be
    # changed to 'Beverage'. If that change were made, every time the word
    # 'Drink' was used, it would have to be changed to 'Beverage'.

    context 'when limiting future code changes' do
      subject(:my_drink) { described_class.new('juice') }

      it 'is juice' do
        expect(my_drink.type).to eq('juice')
      end
    end
  end

  describe '#full?' do
    context 'when using magic matchers' do
      # When using a method that returns a boolean value & does not take any
      # parameters, you can use magic matchers.
      # http://testing-for-beginners.rubymonstas.org/rspec/matchers.html

      context 'when using default initialization' do
        subject(:my_drink) { described_class.new }

        it 'is full' do
          expect(my_drink).to be_full
        end
      end

      context 'when drink has 8 ounces' do
        subject(:my_drink) { Drink.new('coffee', 8) }

        it 'is not full' do
          expect(my_drink).not_to be_full
        end
      end
    end
  end
end

# ASSIGNMENT

describe Drink do
  # Create an explicit subject, using 'described_class' and your choice of
  # beverage type.

  describe '#initialize' do
    context 'when type is specified and ounces is default' do
      # remove the 'x' before running this test
      xit 'is your choice of beverage' do
      end

      # remove the 'x' before running this test
      xit 'has 16 ounces' do
      end
    end
  end

  describe '#full?' do
    context 'when drink has 16 ounces or more' do
      # remove the 'x' before running this test
      xit 'is full' do
      end
    end

    context 'when drink has less than 16 ounces' do
      # remove the 'x' before running this test
      xit 'is not full' do
        # You will need to set the instance_variable for this example.
      end
    end
  end
end
