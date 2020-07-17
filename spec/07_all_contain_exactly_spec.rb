# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# Using the 'all' matcher and the 'contain_exactly' matcher will look at every item in 'numbers'
describe Array do
  let(:numbers) { [11, 17, 21] }

  it 'is all odd numbers' do
    expect(numbers).to all(be_odd)
  end

  it 'is all under 25' do
    expect(numbers).to all(be < 25)
  end

  it 'contains exactly 21, 11, 17' do
    # The order does not matter
    expect(numbers).to contain_exactly(21, 11, 17)
  end
end

describe String do
  let(:sample_word) { 'spaceship' }

  it 'starts with any number of letters up to the entire word' do
    expect(sample_word).to start_with('s')
    expect(sample_word).to start_with('spa')
    expect(sample_word).to start_with('space')
    expect(sample_word).to start_with('spaceship')
  end

  it 'ends with any number of letters up to the entire word' do
    expect(sample_word).to end_with('p')
    expect(sample_word).to end_with('hip')
    expect(sample_word).to end_with('ship')
    expect(sample_word).to end_with('spaceship')
  end
end

describe Array do
  let(:symbol_array) { %i[a b c d e] }

  it 'starts with a and ends with e' do
    expect(symbol_array).to start_with(:a).and end_with(:e)
  end

  it 'starts with a and includes c' do
    expect(symbol_array).to start_with(:a).and include(:c)
  end
end

# ASSIGNMENT

describe Array do
  let(:fibonacci_sequence) { [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89] }
  # Write a test that expresses each of the following statements

  # remove the 'x' before running this test
  xit 'includes 21 and ends with 89' do
  end

  # remove the 'x' before running this test
  xit 'starts with 1, 1, 2 and all are under 100' do
  end
end
# rubocop:enable Layout/LineLength
