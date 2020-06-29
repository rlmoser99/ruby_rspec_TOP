# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# In a typical work-flow, the describe keyword is given a class name or a string argument.
# But for these simple examples, we will be directly passing in an array or string object.
describe [11, 17, 21] do
  it 'is all odd numbers' do
    expect(subject).to all(be_odd)
  end

  it 'is all under 25' do
    expect(subject).to all(be < 25)
  end

  it 'contains exactly 21, 11, 17' do
    # The order does not matter
    expect(subject).to contain_exactly(21, 11, 17)
  end
end

describe 'spaceship' do
  it 'starts with space' do
    expect(subject).to start_with('s')
    expect(subject).to start_with('spa')
    expect(subject).to start_with('space')
    expect(subject).to start_with('spaceship')
  end

  it 'ends with ship' do
    expect(subject).to end_with('p')
    expect(subject).to end_with('hip')
    expect(subject).to end_with('ship')
    expect(subject).to end_with('spaceship')
  end
end

describe [:a, :b, :c, :d, :e] do
  it 'starts with :a and ends with :e' do
    expect(subject).to start_with(:a).and end_with(:e)
  end

  it 'starts with :a and includes :c' do
    expect(subject).to start_with(:a).and include(:c)
  end
end

# ASSIGNMENT

describe [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89] do
  # Write a test that expresses each of the following statements

  # remove the 'x' before running this test
  xit 'includes 21 and ends with 89' do
  end

  # remove the 'x' before running this test
  xit 'starts with 1, 1, 2 and all are under 100' do
  end
end
# rubocop:enable Layout/LineLength
