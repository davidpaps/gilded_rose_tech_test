# frozen_string_literal: true

require 'gilded_rose'
require 'item'

describe 'Backstage passes to a TAFKAL80ETC concert' do
  it 'Quality will increase at a normal rate, when sell_in is positive and decreases' do
    items = [Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 20, quality = 10)]
    subject = GildedRose.new(items)
    2.times { subject.update_quality }
    expect(subject.items[0].quality).to eq(12)
  end

  it 'Quality will increase at double rate whilst sell_in is >5 and <= 10' do
    items = [Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 10)]
    subject = GildedRose.new(items)
    4.times { subject.update_quality }
    expect(subject.items[0].quality).to eq(18)
  end

  it 'Quality will increase at triple rate whilst sell_in is >0 and <= 5' do
    items = [Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 10)]
    subject = GildedRose.new(items)
    3.times { subject.update_quality }
    expect(subject.items[0].quality).to eq(19)
  end

  it 'Quality is never > 50' do
    items = [Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 48)]
    subject = GildedRose.new(items)
    subject.update_quality
    expect(subject.items[0].quality).to eq(50)
  end

  it 'Quality is 0 when sell_in is < 0' do
    items = [Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 1, quality = 30)]
    subject = GildedRose.new(items)
    2.times { subject.update_quality }
    expect(subject.items[0].quality).to eq(0)
  end
end
