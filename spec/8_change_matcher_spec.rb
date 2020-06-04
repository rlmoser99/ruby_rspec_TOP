# frozen_string_literal: true

# https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/change-matcher

describe Array do
  subject(:drinks) { %w[coffee tea water] }

  # Using .or instead of .and to compound matchers
  context 'when testing for multiple outcomes' do
    it 'should be coffee, tea, or water' do
      expect(drinks.sample).to eq('coffee').or eq('tea').or eq('water')
    end
  end

  # Why the { } are used here.
  context 'when testing for a change' do
    it 'should change the length' do
      expect { drinks << 'juice' }.to change { drinks.length }
    end

    it 'should change the length from 3 to 4' do
      expect { drinks << 'juice' }.to change { drinks.length }.from(3).to(4)
    end

    # The above test is too tightly coupled to that specific array.
    # The test should be written for any size of array.
    it 'should increase the length by one' do
      expect { drinks << 'juice' }.to change { drinks.length }.by(1)
    end

    # Options available to be even more specific about the change
    it 'should be even more specific' do
      expect { drinks << 'juice' }.to change { drinks.length }.by_at_least(1)
      expect { drinks << 'juice' }.to change { drinks.length }.by_at_most(1)
    end

    # Testing a value that changed
    it 'should end with tea' do
      expect { drinks.pop }.to change { drinks[-1] }.to('tea')
      # expect { drinks.pop }.to change (drinks, :last).to('tea')
    end

    # Can compound change matchers together
    it 'should decrease by one and end with be tea' do
      expect { drinks.pop }.to change { drinks.length }.by(-1).and change { drinks.last }.to('tea')
    end
  end
end
