# frozen_string_literal: true

require 'gilded_rose'

describe GildedRose do
  describe '#sulfuras_hand_of_ragnaros' do
    it 'quality does not change if sell_in value reduces' do
      items = [double(name: 'Sulfuras, Hand of Ragnaros', sell_in: 5, quality: 80)]
      subject = described_class.new(items)
      expect(subject.items[0].quality).to eq(80)
    end
  end
end
