# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# In a typical work-flow, the object being tested will be located in a different file.
# But for these simple examples, we will be putting the object directly in describe
describe [11, 17, 21] do
  it 'should all be odd numbers' do
    expect(subject).to all(be_odd)
  end
  it 'should all be under 25' do
    expect(subject).to all(be < 25)
  end
  it 'should contain exactly 21, 11, 17' do
    # The order does not matter
    expect(subject).to contain_exactly(21, 11, 17)
  end
end

describe [:a, :b, :c, :d, :e, :f, :g] do
  it 'starts with examples' do
    expect(subject).to start_with(:a)
    expect(subject).to start_with(:a, :b)
    expect(subject).to start_with(:a, :b, :c)
  end
  it 'ends with examples' do
    expect(subject).to end_with(:g)
    expect(subject).to end_with(:f, :g)
    expect(subject).to end_with(:e, :f, :g)
  end
end

describe [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89] do
  it 'includes 21 and ends with 89' do
    expect(subject).to include(21).and end_with(89)
  end
  it 'starts with 1, 1, 2 and all under 100' do
    expect(subject).to start_with(1, 1, 2).and all(be < 100)
  end
end
# rubocop:enable Layout/LineLength
