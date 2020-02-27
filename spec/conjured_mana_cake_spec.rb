# frozen_string_literal: true

require 'gilded_rose'
require 'item'

describe 'Conjured Mana Cake' do
  it 'Quality will degrade at double the normal rate whilst the sell_in is positive' do
    items = [Item.new(name = 'Conjured Mana Cake', sell_in = 6, quality = 10)]
    subject = GildedRose.new(items)
    2.times { subject.update_quality }
    expect(subject.items[0].quality).to eq(6)
  end

  it 'Quality will degrade at quadruple rate whilst sell_in is negative' do
    items = [Item.new(name = 'Conjured Mana Cake', sell_in = 1, quality = 10)]
    subject = GildedRose.new(items)
    3.times { subject.update_quality }
    expect(subject.items[0].quality).to eq(0)
  end

  it 'Quality is never negative' do
    items = [Item.new(name = 'Conjured Mana Cake', sell_in = 0, quality = 8)]
    subject = GildedRose.new(items)
    3.times { subject.update_quality }
    expect(subject.items[0].quality).to eq(0)
  end
end


