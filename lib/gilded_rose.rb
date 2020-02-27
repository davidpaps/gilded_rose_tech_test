# frozen_string_literal: true

require 'normal_items'
require 'conjured_items'
require 'backstage_passes'
require 'aged_brie'
require 'sulfuras'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each do |item|
      if item.name == 'Sulfuras, Hand of Ragnaros'
        Sulfuras.new.update(item)
      elsif item.name == 'Aged Brie'
        AgedBrie.new.update(item)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        BackstagePasses.new.update(item)
      elsif item.name == 'Conjured Mana Cake'
        ConjuredItems.new.update(item)
      elsif item.name == '+5 Dexterity Vest' || 'Elixir of the Mongoose'
        NormalItems.new.update(item)
      end
    end
  end
end
