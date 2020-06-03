# frozen_string_literal: true

# eq checks for equal VALUE
# eql checks for equal VALUE and TYPE
# equal checks for OBJECT IDENTITY
# be checks for OBJECT IDENTITY

# some prefer to use 'be' over 'equal' because semantically makes sense expect(first).to be(second)

# WIP
describe 'differences between eq, eql, equal, and be' do
  # let(:a) { 3.0 }
  # let(:b) { 3 }
  let(:my_car) { [2017, 'red', 'Jetta'] }
  let(:your_car) { [2017, 'red', 'Jetta'] }
  let(:my_kids_borrow) { my_car }

  # context 'eq only looks at value' do
  #   it 'should be eql to each other' do
  #     expect(my_car).to eq(your_car)
  #     expect(my_kids_borrow).to eq(your_car)
  #   end
  # end

  context 'eql looks at type & value' do
    it 'should be eq to each other' do
      expect(my_car).to eql(your_car)
      expect(my_kids_borrow).to eql(your_car)
    end
  end

  context 'be and equal cares about object identity' do
    it 'should be/equal the same car' do
      expect(my_car).to equal(my_kids_borrow)
      expect(my_car).to be(my_kids_borrow)
    end
    it 'should not be/equal your car' do
      expect(my_car).not_to be(your_car)
    end
    it 'should not be/equal any other 2017 red Jetta' do
      expect(my_car).not_to equal([2017, 'red', 'Jetta'])
    end
  end
end
