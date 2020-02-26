require 'gilded_rose'
require 'item'

describe "+5 Dexterity Vest" do

  it "Quality will degrade at a normal rate whilst the sell_in is positive" do
    items = [Item.new(name="+5 Dexterity Vest", sell_in=2, quality=8)]
    subject = GildedRose.new(items)
    2.times {subject.update_quality}
    expect(subject.items[0].quality).to eq(6)
  end

  it "Quality will degrade at double rate whilst sell_in is negative" do
    items = [Item.new(name="+5 Dexterity Vest", sell_in=2, quality=8)]
    subject = GildedRose.new(items)
    4.times {subject.update_quality}
    expect(subject.items[0].quality).to eq(2)
  end

  it "Quality is never negative" do
    items = [Item.new(name="+5 Dexterity Vest", sell_in=1, quality=1)]
    subject = GildedRose.new(items)
    2.times {subject.update_quality}
    expect(subject.items[0].quality).to eq(0)
  end

end