# frozen_string_literal: true

require_relative '../lib/1_basics'

describe Car do
  # before do
  #   @my_car = Car.new('Volkswagon', 'Jetta')
  # end
  let(:my_car) { Car.new('Volkswagon', 'Jetta') }
  it '#make' do
    expect(my_car.make).to eq('Volkswagon')
  end
  it '#model' do
    expect(my_car.model).to eq('Jetta')
  end
  describe 'can change values' do
    it 'should update values ' do
      expect(my_car.model).to eq('Jetta')
      my_car.model = 'Passat'
      expect(my_car.model).to eq('Passat')
    end
  end
  describe 'can change default values' do
    it 'should update values ' do
      expect(my_car.year).to eq(2016)
      my_car.year = 2020
      expect(my_car.year).to eq(2020)
    end
  end
end
