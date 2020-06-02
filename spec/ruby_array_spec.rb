# frozen_string_literal: true

describe Array do
  context 'during each block, subject ' do
    # subject will be an instance of the class listed after describe
    # using context is not required
    it 'should be an Array' do
      expect(subject).to be_a(Array)
    end
    # One-Line Syntex that does the same as the above test. Check out the automatic text output for this test.
    it { is_expected.to be_a(Array) }
  end

  # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/predicate-matchers
  context 'can use predicate matchers' do
    it 'should be empty' do
      expect(subject).to be_empty
    end
    # One-Line Syntex that does the same as the above test. Check out the automatic text output for this test.
    it { is_expected.to be_empty }
  end

  context 'can alter properties of subject' do
    it 'should change the length' do
      expect(subject.length).to eq(0)
      subject << 2
      expect(subject.length).to eq(1)
    end
  end
end

describe Array do
  context "when 'a', 'b' and 'c' are added to the array" do
    it "should equal ['a', 'b', 'c']" do
      subject << 'a'
      subject << 'b'
      subject << 'c'
      expect(subject).to eq(%w[a b c])
    end
  end
end

# ASSIGNMENT
describe String do
  # Make a let variable that will pass the first test.

  # remove the 'x' before running this test
  xit 'should equal tacos' do
    expect(favorite_food).to eq('tacos')
  end

  xit 'should equal your favorite food' do
    # Change the favorite_food variable

    # Write a test that will pass
  end
end
