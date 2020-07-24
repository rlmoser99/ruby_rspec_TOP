# frozen_string_literal: true

require_relative '../lib/10_drink'

describe Drink do
  # Create an explicit subject, using 'described_class' and your choice of
  # beverage type.
  subject(:my_drink) { described_class.new('tea') }

  describe '#initialize' do
    context 'when type is specified and ounces is default' do
      # remove the 'x' before running this test
      it 'is tea' do
        expect(my_drink.type).to eq('tea')
      end

      # remove the 'x' before running this test
      it 'has 16 ounces' do
        expect(my_drink.ounces).to eq(16)
      end
    end
  end

  describe '#full?' do
    context 'when drink has 16 ounces or more' do
      # remove the 'x' before running this test
      it 'is full' do
        expect(my_drink).to be_full
      end
    end

    context 'when drink has less than 16 ounces' do
      # remove the 'x' before running this test
      it 'is not full' do
        # You will need to set the instance_variable for this example.
        my_drink.instance_variable_set(:@ounces, 12)
        expect(my_drink).to_not be_full
      end
    end
  end
end
