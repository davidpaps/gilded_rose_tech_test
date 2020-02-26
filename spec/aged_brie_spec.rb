require 'gilded_rose'
require 'item'

describe "Aged Brie" do

  it "Quality will increase at a normal rate, when sell_in is positive and decreases" do
    items = [Item.new(name="Aged Brie", sell_in=10, quality=10)]
    subject = GildedRose.new(items)
    2.times {subject.update_quality}
    expect(subject.items[0].quality).to eq(12)
  end

  it "Quality will increase at double rate, when sell_in is negative and decreases" do
    items = [Item.new(name="Aged Brie", sell_in=2, quality=8)]
    subject = GildedRose.new(items)
    5.times {subject.update_quality}
    expect(subject.items[0].quality).to eq(16)
  end

  it "Quality is never > 50" do
    items = [Item.new(name="Aged Brie", sell_in=5, quality=48)]
    subject = GildedRose.new(items)
    3.times {subject.update_quality}
    expect(subject.items[0].quality).to eq(50)
  end

end