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
  # Look at the auto-generated doc string when this test is run (in terminal).
  it { is_expected.to be_empty }

  # WIP
  context 'can declare a let variable inside a context block' do
    let(:numbers) { [3, 8, 9] }

    it 'should change the length' do
      expect(numbers.length).to eq(3)
      numbers << 2
      expect(numbers.length).to eq(4)
    end
  end
end

# ASSIGNMENT
describe Array do
  context 'the third item in the implicit subject' do
    # remove the 'x' before running this test
    it 'should equal 21' do
      # update subject to make this test past
      subject << 13 # REMOVE
      subject << 7 # REMOVE
      subject << 21 # REMOVE
      expect(subject[2]).to eq(21)
    end
  end

  # WIP
  context 'can alter properties of subject' do
    # Make a let variable that will pass the first test.
    let(:numbers) { [3, 8, 9] } # REMOVE

    # remove the 'x' before running this test
    it 'should change the length' do
      # expect(subject.length).to eq(0)
      # subject << 2
      expect(numbers.length).to eq(3)
    end
  end
end
