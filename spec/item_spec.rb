# frozen_string_literal: true

require 'item'

describe Item do
  describe '#initialize' do
    it 'is instantiated with the name, sell_in and quality attributes' do
      items = [Item.new(name = '1', sell_in = 2, quality = 3)]
      expect(items[0].name).to eq('1')
      expect(items[0].sell_in).to eq(2)
      expect(items[0].quality).to eq(3)
    end
  end

  describe '#to_s' do
    it 'can interpolate the name, sell_in, and quality attributes into a string' do
      items = [Item.new(name = '1', sell_in = 2, quality = 3)]
      expect(items[0].to_s).to eq '1, 2, 3'
    end
  end
end
