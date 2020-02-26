require 'gilded_rose'
require 'item'

describe "Sulfuras, Hand of Ragnaros" do

  it "Can have a quality of 80" do
    items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=2, quality=80)]
    subject = GildedRose.new(items)
    expect(subject.items[0].quality).to eq(80)
  end

  it "Quality will not degrade if sell_in reduces" do
    items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=4, quality=80)]
    subject = GildedRose.new(items)
    4.times {subject.update_quality}
    expect(subject.items[0].quality).to eq(80)
  end

  it "Quality will not degrade if sell_in is negative" do
    items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80)]
    subject = GildedRose.new(items)
    2.times {subject.update_quality}
    expect(subject.items[0].quality).to eq(80)
  end
  
end