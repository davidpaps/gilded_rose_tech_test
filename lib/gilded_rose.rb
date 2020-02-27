# frozen_string_literal: true

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality

    items.each do |item|
      if item.name == 'Sulfuras, Hand of Ragnaros'
        sulfuras_hand_of_ragnaros(item)
      elsif item.name == 'Aged Brie'
        aged_brie(item)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        backstage_passes(item)
      elsif item.name == '+5 Dexterity Vest' || 'Elixir of the Mongoose'
        dexterity_vest_elixir_of_the_mongoose(item)
      end
    end
  end

  private

  def sulfuras_hand_of_ragnaros(item)
    item.sell_in -= 1
  end

  def dexterity_vest_elixir_of_the_mongoose(item)
    item.sell_in -= 1 
    if item.sell_in >= 0 && ((item.quality - 1) >= 0)
      item.quality -= 1
    elsif ((item.quality - 2) >= 0) 
        item.quality -= 2
    end
  end

  def aged_brie(item)
    item.sell_in -= 1
    if item.quality < 50 && item.sell_in >= 0 
      item.quality += 1
    elsif (item.quality + 2) <= 50 && item.sell_in < 0
      item.quality += 2
    end
  end

  def backstage_passes(item)
    item.sell_in -= 1
    if item.sell_in < 0
      item.quality = 0
    elsif (item.quality + 1) <= 50 && item.sell_in > 10 
      item.quality += 1
    elsif (item.quality + 3) <= 50 && item.sell_in <6
      item.quality += 3
    elsif (item.quality + 2) <= 50 && item.sell_in < 11
      item.quality += 2
    end
  end

end
