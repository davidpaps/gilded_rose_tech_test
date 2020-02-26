require 'gilded_rose'

describe GildedRose do

 items = 
  [ Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
    Item.new(name="Aged Brie", sell_in=2, quality=0),
    Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49) ]

  let(:subject) {GildedRose.new(items)}
  
  
  describe "#update_quality" do
    
    it "takes in '+5 Dexterity Vest' and degrades sell_in and quality normall when sell_in >= 1" do
      subject.update_quality
      expect(subject.items[0].sell_in).to eq(9)
      expect(subject.items[0].quality).to eq(19)
    end

  end




end