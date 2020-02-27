# frozen_string_literal: true

require_relative 'normal_items'
require_relative 'conjured_items'
require_relative 'backstage_passes'
require_relative 'aged_brie'
require_relative 'sulfuras'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each do |item|
      if item.name == 'Sulfuras, Hand of Ragnaros'
        Sulfuras.update(item)
      elsif item.name == 'Aged Brie'
        AgedBrie.update(item)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        BackstagePasses.update(item)
      elsif item.name == 'Conjured Mana Cake'
        ConjuredItems.update(item)
      elsif (item.name == '+5 Dexterity Vest') || (item.name == 'Elixir of the Mongoose')
        NormalItems.update(item)
      end
    end
  end
end
