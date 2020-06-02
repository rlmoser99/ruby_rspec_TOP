# frozen_string_literal: true

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
