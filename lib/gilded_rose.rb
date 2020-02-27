# frozen_string_literal: true

class GildedRose
  attr_reader :items

  ZERO = 0
  NORMAL = 1
  DOUBLE = 2
  TRIPLE = 3
  MAX = 50
 

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
    item.sell_in -= NORMAL
  end

  def dexterity_vest_elixir_of_the_mongoose(item)
    item.sell_in -= NORMAL
    if item.sell_in >= ZERO && ((item.quality - NORMAL) >= ZERO)
      item.quality -= NORMAL
    elsif (item.quality - DOUBLE) >= ZERO
      item.quality -= DOUBLE
    end
  end

  def aged_brie(item)
    item.sell_in -= NORMAL
    if item.quality < MAX && item.sell_in >= ZERO
      item.quality += NORMAL
    elsif (item.quality + DOUBLE) <= MAX && item.sell_in < ZERO
      item.quality += DOUBLE
    end
  end

  def backstage_passes(item)
    item.sell_in -= NORMAL
    if item.sell_in < ZERO
      item.quality = ZERO
    elsif (item.quality + NORMAL) <= MAX && item.sell_in > 10
      item.quality += NORMAL
    elsif (item.quality + TRIPLE) <= MAX && item.sell_in < 6
      item.quality += TRIPLE
    elsif (item.quality + DOUBLE) <= MAX && item.sell_in < 11
      item.quality += DOUBLE
    end
  end
end
