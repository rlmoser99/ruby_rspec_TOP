# frozen_string_literal: true

describe String do
  let(:favorite_color) { String.new('blue') }
  context 'let variables can change values inside an example' do
    it 'should update values ' do
      expect(favorite_color).to eq('blue')
      favorite_color = 'navy blue'
      expect(favorite_color).to eq('navy blue')
    end
  end

  context 'let variables re-set between examples' do
    it 'should be value of let variable' do
      expect(favorite_color).to eq('blue')
    end
  end
end

describe Array do
  context 'subject will be an instance of the class listed after describe' do
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

describe Hash do
  # Instead of using let to declare a variable, you can declare subject with or without a name
  subject(:favorites) { { 'color' => 'blue', 'food' => 'fajitas' } }
  # subject { { 'color' => 'blue', 'food' => 'fajitas' } }
  # let(:favorites) do
  #   { 'color' => 'blue', 'food' => 'fajitas' }
  # end
  it 'should be right' do
    expect(favorites['color']).to eq('blue')
    expect(subject['color']).to eq('blue')
  end

  context 'hash values can change inside an example' do
    it 'should update values' do
      expect(subject['color']).to eq('blue')
      subject['color'] = 'navy blue'
      expect(subject['color']).to eq('navy blue')
    end
  end

  context 'subject re-set between examples' do
    it 'should be blue' do
      expect(subject['color']).to eq('blue')
    end
  end
end
