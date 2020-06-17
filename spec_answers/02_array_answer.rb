# frozen_string_literal: true

describe Array do
  context 'when using an implicit subject, the third element' do
    # remove the 'x' before running this test
    it 'should equal 21' do
      # update the implicit subject to make this test past
      subject << 13
      subject << 7
      subject << 21
      expect(subject[2]).to eq(21)
    end
  end

  context 'when using one let varirable on two tests' do
    # Make a let variable that will pass boths tests.
    let(:lucky_numbers) { [3, 19, 20] }

    # remove the 'x' before running this test
    it 'should have length of 3' do
      expect(lucky_numbers.length).to eq(3)
    end

    # remove the 'x' before running this test
    it 'should have sum of 42' do
      expect(lucky_numbers.sum).to eq(42)
    end
  end
end
