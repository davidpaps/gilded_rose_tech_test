# frozen_string_literal: true
require 'normal_items'
require 'conjured_items'
require 'backstage_passes'

class GildedRose
  attr_reader :items

  ZERO = 0
  NORMAL = 1
  DOUBLE = 2
  TRIPLE = 3
  QUADRUPLE = 4
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
        BackstagePasses.new.update(item)
      elsif item.name == 'Conjured Mana Cake'
        ConjuredItems.new.update(item)
      elsif item.name == '+5 Dexterity Vest' || 'Elixir of the Mongoose'
        NormalItems.new.update(item)
      end
    end
  end

  private

  def sulfuras_hand_of_ragnaros(item)
    minus_day(item)
  end

  def aged_brie(item)
    minus_day(item)
    if (item.quality < MAX) && (item.sell_in >= ZERO)
      improve_quality(item, NORMAL)
    elsif ((item.quality + DOUBLE) <= MAX) && (item.sell_in < ZERO)
      improve_quality(item, DOUBLE)
    end
  end

  def minus_day(item)
    item.sell_in -= NORMAL
  end

  def improve_quality(item, amount)
    item.quality += amount
  end
end
