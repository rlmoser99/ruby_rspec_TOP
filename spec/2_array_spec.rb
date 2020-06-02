# frozen_string_literal: true

describe Array do
  # An implicitly defined 'subject' is available when the outermost example group is a class.
  # 'subject' will be an instance of that class.
  # https://relishapp.com/rspec/rspec-core/v/2-11/docs/subject/implicitly-defined-subject

  context 'when subject is implicitly defined' do
    it 'should be an Array' do
      expect(subject).to be_a(Array)
    end
    # One-line syntex that does the same as the above test.
    # Look at the auto-generated doc string when this test is run (in terminal).
    it { is_expected.to be_a(Array) }
  end

  # There are many predicate matchers to use, for example:
  # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/predicate-matchers
  it 'should be empty' do
    expect(subject).to be_empty
  end
  # One-line syntex that does the same as the above test.
  # Look at the auto-generated doc string when this test file is run (in terminal).
  it { is_expected.to be_empty }

  context 'when a let variablce is declared inside a context block' do
    let(:numbers) { [3, 8, 9] }

    it 'should change the length' do
      expect(numbers.length).to eq(3)
      numbers.pop
      expect(numbers.length).to eq(2)
    end
  end

  # Look at the order of these 5 tests when this test file is run (in terminal).
  # Why do you think they are in a different order then these tests are written?

  # Clarification: one-line tests are only recommended when the matcher aligns exactly with the doc string.
  # However, many ruby-ists prefer explicitly writing out the test & not using one-line syntex.
end

# ASSIGNMENT
describe Array do
  context 'the third item in the implicit subject' do
    # remove the 'x' before running this test
    xit 'should equal 21' do
      # update subject to make this test past
      subject << 13 # REMOVE
      subject << 7 # REMOVE
      subject << 21 # REMOVE
      expect(subject[2]).to eq(21)
    end
  end

  context 'can alter properties of subject' do
    # Make a let variable that will pass the first test.
    let(:lucky_numbers) { [2, 20, 20] } # REMOVE

    # remove the 'x' before running this test
    xit 'should change the length' do
      expect(lucky_numbers.length).to eq(3)
    end

    # remove the 'x' before running this test
    xit 'should equal 42' do
      expect(lucky_numbers.sum).to eq(42)
    end
  end
end
