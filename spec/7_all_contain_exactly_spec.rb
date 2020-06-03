# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# In a typical work-flow, the describe keyword is given a class name or a string argument.
# But for these simple examples, we will be directly passing in an array or string object.
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

describe 'spaceship' do
  it 'starts with space' do
    expect(subject).to start_with('space')
  end

  it 'ends with ship' do
    expect(subject).to end_with('ship')
  end
end

describe [:a, :b, :c, :d, :e, :f, :g] do
  it 'starts with examples' do
    expect(subject).to start_with(:a)
    expect(subject).to start_with(:a, :b, :c)
    expect(subject).to start_with(:a, :b, :c, :d, :e, :f, :g)
  end

  it 'ends with examples' do
    expect(subject).to end_with(:g)
    expect(subject).to end_with(:e, :f, :g)
    expect(subject).to end_with(:a, :b, :c, :d, :e, :f, :g)
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
