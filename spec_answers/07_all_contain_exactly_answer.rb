# frozen_string_literal: true

describe [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89] do
  # Write a test that expresses each of the following statements

  # remove the 'x' before running this test
  it 'should include 21 and end with 89' do
    expect(subject).to include(21).and end_with(89)
  end

  # remove the 'x' before running this test
  it 'should start with 1, 1, 2 and all under 100' do
    expect(subject).to start_with(1, 1, 2).and all(be < 100)
  end
end
