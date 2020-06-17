# frozen_string_literal: true

describe Array do
  it 'should be empty' do
    # Write a test that verifies if subject is empty
    expect(subject).to be_empty
  end

  context 'when my_array has perfect values' do
    # Write a let variable 'my_array' that passes all tests
    let(:my_array) { [-7, 42, 101, 98] }

    # remove the 'x' before running this test
    it 'should have specific first and last values' do
      expect(my_array.first).to be_odd.and be <= -1
      expect(my_array.last).to be_even.and be < 99
    end

    # remove the 'x' before running this test
    it 'should have specific min and max values' do
      expect(my_array.min).not_to be < -9
      expect(my_array.max).to be > 100
    end

    # remove the 'x' before running this test
    it 'should include a value of 42' do
      expect(my_array).to include(42)
    end

    # remove the 'x' before running this test
    it 'should have at least four values' do
      expect(my_array[3]).not_to be_nil
    end
  end
end
