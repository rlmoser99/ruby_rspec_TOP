# frozen_string_literal: true

# rubocop:disable Layout/LineLength
describe Array do
  # An implicitly defined 'subject' is available when the outermost example group is a class.
  # 'subject' will be an instance of that class.
  # https://relishapp.com/rspec/rspec-core/v/2-11/docs/subject/implicitly-defined-subject

  context 'when subject is implicitly defined' do
    # type matchers:
    # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/type-matchers
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

  context 'when a let variable is declared inside a context block' do
    let(:numbers) { [3, 8, 9] }

    it 'should change the length from 3 to 2' do
      expect(numbers.length).to eq(3)
      numbers.pop
      expect(numbers.length).to eq(2)
    end
  end

  # Look at the order of these 5 tests when this test file is run (in terminal).
  # Why do you think they are in a different order then these tests are written?

  # Please note: one-line tests are only recommended when the matcher aligns exactly with the doc string.
  # However, many ruby-ists prefer explicitly writing out the test & not using one-line syntex.
end

# ASSIGNMENT
describe Array do
  context 'when using an implicit subject, the third element' do
    # remove the 'x' before running this test
    xit 'should equal 21' do
      # update the implicit subject to make this test past
      subject << 13 # REMOVE
      subject << 7 # REMOVE
      subject << 21 # REMOVE
      expect(subject[2]).to eq(21)
    end
  end

  context 'when using one let varirable on two tests' do
    # Make a let variable that will pass boths tests.

    # remove the 'x' before running this test
    xit 'should have length of 3' do
      expect(lucky_numbers.length).to eq(3)
    end

    # remove the 'x' before running this test
    xit 'should have sum of 42' do
      expect(lucky_numbers.sum).to eq(42)
    end
  end
end
# rubocop:enable Layout/LineLength
