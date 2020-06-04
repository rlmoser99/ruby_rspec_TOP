# frozen_string_literal: true

describe Array do
  subject(:drinks) { %w[coffee tea water] }

  # Using .or instead of .and when compounding matchers
  context 'when testing for multiple outcomes' do
    it 'should be coffee, tea, or water' do
      expect(drinks.sample).to eq('coffee').or eq('tea').or eq('water')
    end
  end

  # Testing for a change to occur
  # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/change-matcher
  context 'when testing for a change' do
    it 'should change the length' do
      expect { drinks << 'juice' }.to change { drinks.length }
    end

    it 'should change the length to 4' do
      expect { drinks << 'juice' }.to change { drinks.length }.to(4)
    end

    it 'should change the length from 3 to 4' do
      expect { drinks << 'juice' }.to change { drinks.length }.from(3).to(4)
    end

    # The above two tests are too tightly coupled to that specific array.
    # The test should be written for any length of array, for example:
    it 'should increase the length by one' do
      expect { drinks << 'juice' }.to change { drinks.length }.by(1)
    end

    # Options available to be even more specific about the change
    it 'should be even more specific' do
      expect { drinks << 'juice' }.to change { drinks.length }.by_at_least(1)
      expect { drinks << 'juice' }.to change { drinks.length }.by_at_most(1)
    end

    # Can compound change matchers together
    it 'should decrease by one and end with be tea' do
      expect { drinks.pop }.to change { drinks.length }.by(-1).and change { drinks.last }.to('tea')
    end
  end
end

# ASSIGNMENT:

describe 'lucky numbers with rotate! method' do
  subject(:lucky_numbers) { [3, 7, 13, 31, 42] }
  # Write a test that expresses each of the following statements

  context 'when rotating the array of lucky numbers' do
    # remove the 'x' before running this test
    xit 'should change the first value to 7' do
      expect { lucky_numbers.rotate! }.to change { lucky_numbers.first }.to(7) # REMOVE
    end

    # remove the 'x' before running this test
    xit 'should change the last value to 3' do
      expect { lucky_numbers.rotate! }.to change { lucky_numbers.last }.to(3) # REMOVE
    end

    # remove the 'x' before running this test
    xit 'should change the first value to 7 and last value to 3' do
      expect { lucky_numbers.rotate! }.to change { lucky_numbers.first }.to(7).and change { lucky_numbers.last }.to(3) # REMOVE
    end
  end
end
